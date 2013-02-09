//
//  SAxDSAViewController.m
//  SAx Lite2
//
//  Created by Fabrice Guillaume on 2/6/13.
//  Copyright (c) 2013 Fabrice Guillaume. All rights reserved.
//


#import "SAxDSAViewController.h"
#import "SAxDSAPodTableViewController.h"
#import "ShinobiLicense.h"
#import "SAxRequestGetData.h"
#import "DataProviderService.h"


@interface SAxDSAViewController ()

@end

@implementation SAxDSAViewController

@synthesize popover, podName, labelSAx;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // create popover and point it to the table of pods
    SAxDSAPodTableViewController *tableVS = [[SAxDSAPodTableViewController alloc]init];
    // set ourselves as the Table VS's delegate
    tableVS.delegate=self;
    
    popover = [[UIPopoverController alloc] initWithContentViewController:tableVS];
    
    // set ourselves as the Table VS's delegate
    [popover setDelegate:self];
    
    labelSAx.text = @"Please select a pod from the list in the top right corner...";

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPodListTapped:(id)sender {
    // check if there is no other and if yes dismiss it (if not we will have several
    // if the user clicks on it
    if ([popover isPopoverVisible]) {
        [popover dismissPopoverAnimated:YES];
    }
    
    [popover setPopoverContentSize:CGSizeMake(320, 600)];
    
    [popover presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
    labelSAx.text = nil;
}


// Implement delegate method to dismiss pover
-(void)dismissPopover: (NSString *)selectedPod
{
    podName = selectedPod;
    dNSLog(@"dismiss popover delegate");
    [popover dismissPopoverAnimated:YES];
    
    [self updateChart];
     
}

-(void) updateChart
{
    // Send the request asynchronousely
    
    // Pass call back when response came back
    
    // Parse XML results
    
    // Update shinobi chart
    // with new value for filters
    
    
    [self processRequestGetData];
    
    // Update chart fo row selection
    dNSLog(@"update chart for selected pod:%@", podName);
    
    
    // Clear previous chart and load new one
    [self drawPieChart];
}

// Implement delegate for touch outside of popover to dismiss it
-(void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    dNSLog(@"User dismissed popover");
}

-(void) drawPieChart
{
    // Enter License key / License date
    NSString *licenseKey = [ShinobiLicense getShinobiLicenseKey];
    NSDate *licenseDate = [ShinobiLicense getShinobiLicenseDate];
    NSDate *today = [NSDate date];

    chart = [[ShinobiChart alloc] initWithFrame:self.view.bounds];
    
    if (!licenseKey)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Shinobi License Error"
                                                            message:@"The license key is missing"
                                                           delegate:self
                                                            cancelButtonTitle:@"OK"
                                                            otherButtonTitles:nil, nil];
        
        dNSLog(@"Shinobi License is missing. check ShinobiSettings.plist");
        [alertView show];
        return;
    }
    
    if ((!licenseDate) || ([licenseDate compare:today] == NSOrderedAscending))
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Shinobi License Error"
                                                            message:@"The license key has expired or is missing. Please request a new 30days evaluation or get a permanent."
                                                           delegate:self
                                                            cancelButtonTitle:@"OK"
                                                            otherButtonTitles:nil, nil];

        if (!licenseDate)
            dNSLog(@"Shinobi License Date is missing. check ShinobiSettings.plist");
        dNSLog(@"Shinobi License expiration Date: %@ is older than current date: %@", licenseDate, today);
        
        [alertView show];
        return;
    }
    
    chart.title = podName;
    chart.theme.chartTitleStyle.position = SChartTitlePositionCenter;
    
    // Set the resizing mask to allow it to automatically resize when the screen orientation changes.
    chart.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin |
    UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleTopMargin |
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin |
    UIViewAutoresizingFlexibleRightMargin;
    
    chart.legend.hidden = NO;
    chart.legend.position = SChartLegendPositionBottomMiddle;
    chart.legend.maxSeriesPerLine = 1;
    
    chart.licenseKey = licenseKey;

    chart.datasource = self;
    //chart.delegate = self;
    
    // Add the chart to the view controller
    [self.view addSubview:chart];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return (interfaceOrientation == UIInterfaceOrientationMaskAllButUpsideDown);
}

// Shinobi delegate methods
// Returns the number of series in the specified chart
- (int)numberOfSeriesInSChart:(ShinobiChart *)chart {
    return 3;
}

// Returns the series at the specified index for a given chart
- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(int)index {
    // For Pie chart we would not have several series...
    // SChartLineSeries *lineSeries = [[[SChartLineSeries alloc] init]
    SChartPieSeries *pieSeries = [[SChartPieSeries alloc] init];

    // Set up the series
    pieSeries.title = [NSString stringWithFormat:@"serie %d", index];
    
    return pieSeries;
}

// Determine the number of data points that the series will contain.
- (int)sChart:(ShinobiChart *)chart numberOfDataPointsForSeriesAtIndex:(int)seriesIndex {
    // In this example each series has 10 points
    return 4;
    
    // need to count the resulted data set
}


// Returns the data point at the specified index for the given series/chart.
- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(int)dataIndex forSeriesAtIndex:(int)seriesIndex {
    
    SChartRadialDataPoint *datapoint = [SChartRadialDataPoint new];

    // Pass the values form the service...
    //datapoint.name = [[_osData osTypes] objectAtIndex:dataIndex];
    //datapoint.value = [[_osData osData] objectForKey:dp.name];
    
    datapoint.name = @"test";
    datapoint.value = [[NSNumber alloc] initWithFloat:3.2];
    
    return datapoint;
}


-(void)processRequestGetData
{
    BasicHttpBinding_IDataProviderService *binding = [DataProviderService BasicHttpBinding_IDataProviderService];
    DataProviderService_GetData *request = [[DataProviderService_GetData alloc] init];
    BasicHttpBinding_IDataProviderServiceResponse *response;
    
    // Context Info Parameter
    tns2_ArrayOfstring *contexInfo = [[tns2_ArrayOfstring alloc] init];
    [contexInfo addString:@"dashboardID=100001"];
    [contexInfo addString:@"podID=0"];
    [contexInfo addString:@"podModeID=0"];
    [contexInfo addString:@"UserId=fguillaume"];
    [contexInfo addString:@"versionID=332"];
    [contexInfo addString:@"DASH_POD_TYPE=Pod"];
    [contexInfo addString:@"podType=SQLPod"];
    
    // Exception Mode Parameter
    tns1_ExceptionMode exceptionMode = tns1_ExceptionMode_enumFromString(@"None");
    
    // Force Data Refresh Parameter
    USBoolean *forceDataRefresh = [[USBoolean alloc] init];
    forceDataRefresh.boolValue = NO;
    
    // Page Info Parameter
    tns1_PagingDTO *pageInfo = [[tns1_PagingDTO alloc] init];
    pageInfo.PageSize = [NSNumber numberWithInt:25];
    pageInfo.RequiredPage = [NSNumber numberWithInt:1];
    
    // Post Exec Filter Parameter
    tns1_ArrayOfFilterDTO *postExecFilter = [[tns1_ArrayOfFilterDTO alloc] init];
    
    // Pre Exec Filter Parameter
    tns1_ArrayOfFilterDTO *preExecFilter = [[tns1_ArrayOfFilterDTO alloc] init];
    
    tns1_FilterDTO *filter1 = [[tns1_FilterDTO alloc] init];
    filter1.ComparisonOperator = nil;
    filter1.Name = @"TREE_LEVEL_LOCAL_TREE_DataServicesHierarchy";
    filter1.Value = @"1";
    
    tns1_FilterDTO *filter2 = [[tns1_FilterDTO alloc] init];
    filter2.ComparisonOperator = nil;
    filter2.Name = @"LOCAL_TREE_DataServicesHierarchy";
    filter2.Value = @"CIMXM_DATA_SERVICES_HIERARCHY~ROOT";
    
    tns1_FilterDTO *filter3 = [[tns1_FilterDTO alloc] init];
    filter3.ComparisonOperator = nil;
    filter3.Name = @"GLOBAL_DROPDOWN_Indicators";
    filter3.Value = @"Avg Data Volume per Session (MB)";
    
    tns1_FilterDTO *filter4 = [[tns1_FilterDTO alloc] init];
    filter4.ComparisonOperator = nil;
    filter4.Name = @"GLOBAL_DATE_Date";
    filter4.Value = @"Days~08/06/2012~08/06/2012";
    
    tns1_FilterDTO *filter5 = [[tns1_FilterDTO alloc] init];
    filter5.ComparisonOperator = nil;
    filter5.Name = @"DROPDOWN_CustomerType_ALL_ITEMS";
    filter5.Value = @"true";
    
    tns1_FilterDTO *filter6 = [[tns1_FilterDTO alloc] init];
    filter6.ComparisonOperator = nil;
    filter6.Name = @"GLOBAL_DROPDOWN_CustomerType";
    filter6.Value = @"EM~LC~NA~RS~Unknown";
    
    tns1_FilterDTO *filter7 = [[tns1_FilterDTO alloc] init];
    filter7.ComparisonOperator = nil;
    filter7.Name = @"DROPDOWN_BillingType_ALL_ITEMS";
    filter7.Value = @"true";
    
    tns1_FilterDTO *filter8 = [[tns1_FilterDTO alloc] init];
    filter8.ComparisonOperator = nil;
    filter8.Name = @"GLOBAL_DROPDOWN_BillingType";
    filter8.Value = @"POS~PRE~Unknown";
    
    tns1_FilterDTO *filter9 = [[tns1_FilterDTO alloc] init];
    filter9.ComparisonOperator = nil;
    filter9.Name = @"DROPDOWN_SegmentType_ALL_ITEMS";
    filter9.Value = @"true";
    
    tns1_FilterDTO *filter10 = [[tns1_FilterDTO alloc] init];
    filter10.ComparisonOperator = nil;
    filter10.Name = @"GLOBAL_DROPDOWN_SegmentType";
    filter10.Value = @"GGCC~MICROPYME~PYME~SOHO~TOP_SME~";
    
    tns1_FilterDTO *filter11 = [[tns1_FilterDTO alloc] init];
    filter11.ComparisonOperator = nil;
    filter11.Name = @"DROPDOWN_CustomerOption_ALL_ITEMS";
    filter11.Value = @"true";
    
    tns1_FilterDTO *filter12 = [[tns1_FilterDTO alloc] init];
    filter12.ComparisonOperator = nil;
    filter12.Name = @"GLOBAL_DROPDOWN_CustomerOption";
    filter12.Value = @"0~1";
    
    tns1_FilterDTO *filter13 = [[tns1_FilterDTO alloc] init];
    filter13.ComparisonOperator = nil;
    filter13.Name = @"DROPDOWN_Gender_ALL_ITEMS";
    filter13.Value = @"true";
    
    tns1_FilterDTO *filter14 = [[tns1_FilterDTO alloc] init];
    filter14.ComparisonOperator = nil;
    filter14.Name = @"GLOBAL_DROPDOWN_Gender";
    filter14.Value = @"Male~Female~Other";
    
    tns1_FilterDTO *filter15 = [[tns1_FilterDTO alloc] init];
    filter15.ComparisonOperator = nil;
    filter15.Name = @"DROPDOWN_Age_ALL_ITEMS";
    filter15.Value = @"true";
    
    tns1_FilterDTO *filter16 = [[tns1_FilterDTO alloc] init];
    filter16.ComparisonOperator = nil;
    filter16.Name = @"GLOBAL_DROPDOWN_Age";
    filter16.Value = @"(dsub.age BETWEEN 0 AND 17)~(dsub.age BETWEEN 18 AND 24)~(dsub.age BETWEEN 25 AND 34)~(dsub.age BETWEEN 35 AND 54)~(dsub.age &gt;= 55)~(dsub.age = -1)";
    
    tns1_FilterDTO *filter17 = [[tns1_FilterDTO alloc] init];
    filter17.ComparisonOperator = nil;
    filter17.Name = @"TREE_LEVEL_GLOBAL_TREE_TariffPlan";
    filter17.Value = @"1";
    
    tns1_FilterDTO *filter18 = [[tns1_FilterDTO alloc] init];
    filter18.ComparisonOperator = nil;
    filter18.Name = @"GLOBAL_TREE_TariffPlan";
    filter18.Value = @"CIMXM_TARIFF_TREE_ID~ROOT";
    
    tns1_FilterDTO *filter19 = [[tns1_FilterDTO alloc] init];
    filter19.ComparisonOperator = nil;
    filter19.Name = @"TREE_LEVEL_GLOBAL_TREE_Options";
    filter19.Value = @"1";
    
    tns1_FilterDTO *filter20 = [[tns1_FilterDTO alloc] init];
    filter20.ComparisonOperator = nil;
    filter20.Name = @"GLOBAL_TREE_Options";
    filter20.Value = @"CIMXM_OPTIONS_TREE_ID~ROOT";
    
    tns1_FilterDTO *filter21 = [[tns1_FilterDTO alloc] init];
    filter21.ComparisonOperator = nil;
    filter21.Name = @"TREE_LEVEL_GLOBAL_TREE_Device";
    filter21.Value = @"1";
    
    tns1_FilterDTO *filter22 = [[tns1_FilterDTO alloc] init];
    filter22.ComparisonOperator = nil;
    filter22.Name = @"GLOBAL_TREE_Device";
    filter22.Value = @"CIMXM_DEVICE_TREE_ID~ROOT";
    
    tns1_FilterDTO *filter23 = [[tns1_FilterDTO alloc] init];
    filter23.ComparisonOperator = nil;
    filter23.Name = @"TREE_LEVEL_GLOBAL_TREE_OS";
    filter23.Value = @"1";
    
    tns1_FilterDTO *filter24 = [[tns1_FilterDTO alloc] init];
    filter24.ComparisonOperator = nil;
    filter24.Name = @"GLOBAL_TREE_OS";
    filter24.Value = @"CIMXM_OS_TREE_ID~ROOT";
    
    tns1_FilterDTO *filter25 = [[tns1_FilterDTO alloc] init];
    filter25.ComparisonOperator = nil;
    filter25.Name = @"TREE_LEVEL_GLOBAL_TREE_Location";
    filter25.Value = @"1";
    
    tns1_FilterDTO *filter26 = [[tns1_FilterDTO alloc] init];
    filter26.ComparisonOperator = nil;
    filter26.Name = @"GLOBAL_TREE_Location";
    filter26.Value = @"CIMXM_LOCATION_TREE_ID~ROOT";
    
    tns1_FilterDTO *filter27 = [[tns1_FilterDTO alloc] init];
    filter27.ComparisonOperator = nil;
    filter27.Name = @"DROPDOWN_Roaming_ALL_ITEMS";
    filter27.Value = @"true";
    
    tns1_FilterDTO *filter28 = [[tns1_FilterDTO alloc] init];
    filter28.ComparisonOperator = nil;
    filter28.Name = @"GLOBAL_DROPDOWN_Roaming";
    filter28.Value = @"2~1~-1";
    
    tns1_FilterDTO *filter29 = [[tns1_FilterDTO alloc] init];
    filter29.ComparisonOperator = nil;
    filter29.Name = @"DROPDOWN_NetworkType_ALL_ITEMS";
    filter29.Value = @"true";
    
    tns1_FilterDTO *filter30 = [[tns1_FilterDTO alloc] init];
    filter30.ComparisonOperator = nil;
    filter30.Name = @"GLOBAL_DROPDOWN_NetworkType";
    filter30.Value = @"2~1~3~-1";
    
    [preExecFilter addFilterDTO:filter1];
    [preExecFilter addFilterDTO:filter2];
    [preExecFilter addFilterDTO:filter3];
    [preExecFilter addFilterDTO:filter4];
    [preExecFilter addFilterDTO:filter5];
    [preExecFilter addFilterDTO:filter6];
    [preExecFilter addFilterDTO:filter7];
    [preExecFilter addFilterDTO:filter8];
    [preExecFilter addFilterDTO:filter9];
    [preExecFilter addFilterDTO:filter10];
    [preExecFilter addFilterDTO:filter11];
    [preExecFilter addFilterDTO:filter12];
    [preExecFilter addFilterDTO:filter13];
    [preExecFilter addFilterDTO:filter14];
    [preExecFilter addFilterDTO:filter15];
    [preExecFilter addFilterDTO:filter16];
    [preExecFilter addFilterDTO:filter17];
    [preExecFilter addFilterDTO:filter18];
    [preExecFilter addFilterDTO:filter19];
    [preExecFilter addFilterDTO:filter20];
    [preExecFilter addFilterDTO:filter21];
    [preExecFilter addFilterDTO:filter22];
    [preExecFilter addFilterDTO:filter23];
    [preExecFilter addFilterDTO:filter24];
    [preExecFilter addFilterDTO:filter25];
    [preExecFilter addFilterDTO:filter26];
    [preExecFilter addFilterDTO:filter27];
    [preExecFilter addFilterDTO:filter28];
    [preExecFilter addFilterDTO:filter29];
    [preExecFilter addFilterDTO:filter30];
    
    // Request Id Parameter
    NSString *requestId = @"1355922890930";
    
    // Sort Info
    tns1_ArrayOfSortDTO *sortInfo = [[tns1_ArrayOfSortDTO alloc] init];
    
    // Parameter object creation
    tns1_GetDataParamsDTO *parameters = [[tns1_GetDataParamsDTO alloc] init];
    parameters.ContextInfo = contexInfo;
    parameters.ExceptionMode = exceptionMode;
    parameters.ForceDataRefresh = forceDataRefresh;
    parameters.PageInfo = pageInfo;
    parameters.PostExecFilter = postExecFilter;
    parameters.PreExecFilter = preExecFilter;
    parameters.RequestId = requestId;
    parameters.SortInfo = sortInfo;
    
    // Fill Request
    request.dataProvID = @"DASH_SQL_EXEC";
    request.parameters = parameters;
    
    // Send Request
    dNSLog(@"\t[SOAP-Request] Sending request, DashboardID = %d, PodID = %d", 100001, 0);
    
    response = [binding GetDataUsingParameters:request];
    dNSLog(@"\t[SOAP-Request] request = %@", request.description);
    dNSLog(@"\t[SOAP-Request] request parameters = %@", request.parameters.description);

    dispatch_async(dispatch_get_main_queue(), ^{ [self processResponseGetData:response]; });
}


-(void)processResponseGetData :(BasicHttpBinding_IDataProviderServiceResponse *)soapResponse
{
    NSArray *responseBodyParts = soapResponse.bodyParts;
    dNSLog(@"\t[SOAP-Response] Response received");

    id bodyPart;
    
    @try {
        bodyPart = [responseBodyParts objectAtIndex:0];
    }
    @catch (NSException *exception) {
        dNSLog(@"\t[SOAP-Response] Exception received: name: %@, reason: %@", [exception name], [exception reason]);

        UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"Server Error" message:@"Error while trying to process request" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        return;
    }
    
    if ([bodyPart isKindOfClass:[SOAPFault class]]) {
        NSString *errorMsg = ((SOAPFault *)bodyPart).simpleFaultString;
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Server Error" message:errorMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    else if ([bodyPart isKindOfClass:[DataProviderService_GetDataResponse class]]) {
        DataProviderService_GetDataResponse *dataResponse = bodyPart;
        dNSLog(@"\t codeText=%@", dataResponse.GetDataResult.Code);
        dNSLog(@"\t descriptionText=%@", dataResponse.GetDataResult.Description);
        dNSLog(@"\t resultObject=%@", dataResponse.GetDataResult.ResultObject);

    }
}


@end
