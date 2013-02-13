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
#import "SAxSOAPProxyGetData.h"
#import "SAxParserXML.h"
#import "SAxMetadataStore.h"
#import "ShinobiChart+PieCharts.h"

@interface SAxDSAViewController () {
    BOOL first;
}

@end

@implementation SAxDSAViewController

@synthesize popover, podName, labelSAx;
@synthesize seriesPointsNames, seriesPointsValues;

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
    [self.view setBackgroundColor:[UIColor grayColor]];
	// Do any additional setup after loading the view.
    
    // create popover and point it to the table of pods
    SAxDSAPodTableViewController *tableVS = [[SAxDSAPodTableViewController alloc]init];
    // set ourselves as the Table VS's delegate
    tableVS.delegate=self;
    
    popover = [[UIPopoverController alloc] initWithContentViewController:tableVS];
    
    // set ourselves as the Table VS's delegate
    [popover setDelegate:self];
    
    labelSAx.text = @"Please select a pod from the list in the top right corner...";

    //Indicate that this is our first render
    first = YES;
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
    dNSLog(@"[SAxDSA] Dismiss popover delegate");
    [popover dismissPopoverAnimated:YES];
    
    [self updateChart];
     
}

-(void) updateChart
{
    BOOL success = YES;
    
    // XML CONFIG Data - Parsing
    // Getting the config data for the pod
    // We will use this mainly for the chart type - see CHART_STYLE_XML_METADATA
    // Ex: <Property name="CHART_STYLE_XML_METADATA" value="<chart type="pie"
    // chartPieGroupThreshold="3" legendPlacement="bottom">
    
    // NOTE - I am commeting out the Config data parsing as it errors out with and Error 65
    // because of 2 <Property> tags that have a lot of "" values for the <value> tag
    // See OLAP_POD_LOCAL_TREE_FILTER_DataServicesHierarchy and GRID_ROW_ACTIONS
    // If we find a way to not have the parser exit on these errors, we can get the chart type
    // .. using the <Property name="CHART_STYLE_XML_METADATA" value="<chart type="...
    // I will hard code for bow the chart type
    /*
    SAxSOAPProxyGetData *requestConfig = [[SAxSOAPProxyGetData alloc]init];
    [requestConfig processRequestGetDataProviderConfig];
    
    // Parse XML Config results
    dNSLog(@"[SAxDSA] Launching the parser for Config data");
    
    // create and init NSXMLParser object
    NSXMLParser *nsXmlParserConfig = [[NSXMLParser alloc] initWithData:[requestConfig xmlConfigData]];
    [nsXmlParserConfig setShouldProcessNamespaces:NO];
    [nsXmlParserConfig setShouldReportNamespacePrefixes:NO];
    [nsXmlParserConfig setShouldResolveExternalEntities:NO];
    
    // create and init our delegate
    SAxParserXML *parserConfig = [[SAxParserXML alloc] initXMLParser];
    
    // set delegate
    [nsXmlParserConfig setDelegate:parserConfig];
    
    // parsing...
    success = [nsXmlParserConfig parse];
    
    // test the result
    if (!success) {
        dNSLog(@"\t[SAxParser] Error parsing CONFIG DATA!");
        // Add alert...
        return;
    }
    */
    
    NSString *chartType = @"pie";   // temporaryly hardcoded because of Config parser issues
    
    // XML DATA - Parsing
    // Getting the actual series name/values for the pod
    SAxSOAPProxyGetData *request = [[SAxSOAPProxyGetData alloc]init];
    [request processRequestGetData];
    
    // Parse XML Data results
    dNSLog(@"[SAxDSA] Launching the parser for data");
    
    // create and init NSXMLParser object
    NSXMLParser *nsXmlParser = [[NSXMLParser alloc] initWithData:[request xmlData]];
    
    [nsXmlParser setShouldProcessNamespaces:NO];
    [nsXmlParser setShouldReportNamespacePrefixes:NO];
    [nsXmlParser setShouldResolveExternalEntities:NO];
    
    // create and init our delegate
    SAxParserXML *parser = [[SAxParserXML alloc] initXMLParser];
    
    // set delegate
    [nsXmlParser setDelegate:parser];
    
    // parsing...
    success = [nsXmlParser parse];
    
    // test the result
    if (!success) {
        dNSLog(@"\t[SAxParser] Error parsing DATA!");
        // Add alert...
        return;
    }

        
    // DATA series
    // Indicator name is the 3rd of the Metadata section
    dNSLog(@"[SAxDSA] DATA: MetaData properties count:%d", [[parser metaCols] count]);
    NSString *indicator = [[NSString alloc]initWithFormat:[[[parser metaCols] objectAtIndex:3] metaDataName]];
    dNSLog(@"[SAxDSA] DATA: Indicator Name:%@", indicator);
    

    // Series Name and Values are 3rd and 4th of the Data section
    seriesPointsCount = [[parser dataRows]count];
    dNSLog(@"[SAxDSA] DATA: Data count (Series):%d", seriesPointsCount);
    
    seriesPointsNames = [[NSMutableArray alloc] init];
    seriesPointsValues = [[NSMutableArray alloc] init];
    float sum = 0;
    for (int i=0; i< [[parser dataRows]count]; i++)
    {
        dNSLog(@"[SAxDSA  DATA: - Serie Name: %@", [[[parser dataRows]objectAtIndex:i]dataSerieName]);
        NSString *name = [[NSString alloc]initWithString:[[[parser dataRows]objectAtIndex:i]dataSerieName]];
        
        [seriesPointsNames addObject:name];
        
        dNSLog(@"[SAxDSA  DATA: - Serie Value: %@", [[[parser dataRows]objectAtIndex:i]dataSerieValue]);
        NSString *value = [[NSString alloc] initWithString:[[[parser dataRows]objectAtIndex:i]dataSerieValue]];
        
        [seriesPointsValues addObject:value];
        
        // Sum the values for % display if pie chart
        if ([chartType isEqualToString:@"pie"])
            sum = sum + [[seriesPointsValues objectAtIndex:i]floatValue];

    }
    
    
    // Update shinobi chart
    dNSLog(@"[SAxDSA] Update chart for selected pod:%@", podName);
    
    // Clear previous chart and load new one
    if ([chartType isEqualToString:@"pie"])
    {
        // Need to update the returned values to be % (sum of all is 100)
        for (int i = 0 ; i < [seriesPointsValues count]; i++)
        {
            float num = 0.0;
            num =[[seriesPointsValues objectAtIndex:i]floatValue]/sum*100;
            NSString *value = [NSString stringWithFormat:@"%f",num];
            [seriesPointsValues setObject:value atIndexedSubscript:i];
        }
        
        dNSLog(@"[SAxDSA CHART: pie chart type - drawing...");
        dNSLog(@"[SAxDSA CHART: sum denominator = %f", sum);
        
        [self drawPieChart];
        
    } else if ([chartType isEqualToString:@"lines"])
    {
        dNSLog(@"[SAxDSA CHART: line chart type - drawing...");
        
    }

}




// Implement delegate for touch outside of popover to dismiss it
-(void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    dNSLog(@"[SAxDSA] User dismissed popover");
}

-(void) drawPieChart
{
    // Enter License key / License date
    NSString *licenseKey = [ShinobiLicense getShinobiLicenseKey];
    NSDate *licenseDate = [ShinobiLicense getShinobiLicenseDate];
    NSDate *today = [NSDate date];

    CGRect pieFrame = CGRectMake(26,100,712,830);
    shinoChart = [ShinobiChart pieChartForOSDataWithFrame:pieFrame];
    
    //pieFrame = self.view.bounds;
    
    if (!licenseKey)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Shinobi License Error"
                                                            message:@"The license key is missing"
                                                           delegate:self
                                                            cancelButtonTitle:@"OK"
                                                            otherButtonTitles:nil, nil];
        
        dNSLog(@"[SAxDSA] Shinobi License is missing. check ShinobiSettings.plist");
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
            dNSLog(@"[SAxDSA] Shinobi License Date is missing. check ShinobiSettings.plist");
        dNSLog(@"[SAxDSA] Shinobi License expiration Date: %@ is older than current date: %@", licenseDate, today);
        
        [alertView show];
        return;
    }
    
    shinoChart.title = podName;
    shinoChart.theme.chartTitleStyle.position = SChartTitlePositionCenter;
    
    // Set the resizing mask to allow it to automatically resize when the screen orientation changes.
    shinoChart.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin |
    UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleTopMargin |
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin |
    UIViewAutoresizingFlexibleRightMargin;
    
    shinoChart.legend.hidden = NO;
    shinoChart.legend.position = SChartLegendPositionBottomMiddle;
    shinoChart.legend.maxSeriesPerLine = 1;
    
    shinoChart.licenseKey = licenseKey;

    shinoChart.datasource = self;
    //shinoChart = self;
    
    // Add the chart to the view controller
    [self.view addSubview:shinoChart];
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
    return 1;
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

    return seriesPointsCount;
    
}


// Returns the data point at the specified index for the given series/chart.
- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(int)dataIndex forSeriesAtIndex:(int)seriesIndex {
    
    SChartRadialDataPoint *datapoint = [SChartRadialDataPoint new];
    
    datapoint.name = [seriesPointsNames objectAtIndex:dataIndex];
    datapoint.value = [seriesPointsValues objectAtIndex:dataIndex];
    
    return datapoint;
}

- (void)sChart:(ShinobiChart *)chart alterLabel:(UILabel *)label forDatapoint:(SChartRadialDataPoint *)datapoint atSliceIndex:(int)index inRadialSeries:(SChartRadialSeries *)series
{
    //For our pie chart - stop displaying labels for narrow slices
    if (chart == shinoChart) {
        label.adjustsFontSizeToFitWidth = YES;
        
        if (datapoint.value.floatValue < 2.f) {
            label.text = @"";
            
        }  else if (datapoint.value.floatValue < 15.f) {
            label.adjustsFontSizeToFitWidth = YES;
            CGRect f = label.frame;
            f.size.width = 35.f;
            label.frame = f;
        }
    }
}

@end
