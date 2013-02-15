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
#import "OCCalendarViewController.h"
#import <ShinobiCharts/SChartCanvas.h>
#import "LineView.h"


@interface SAxDSAViewController () {
    BOOL first;
    LineView *lineView;
}

@end

@implementation SAxDSAViewController

@synthesize popover, podName, labelSAx;
@synthesize seriesPointsNames, seriesPointsValues, podFilters;

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
    
    // Draw chart with default filters - should be for yesterday's data
    // but for this demo we will put it as August 6
    NSString *date = @"Days~08/06/2012~08/06/2012";
    [self updateChart:date];
    
}

-(void) updateChart: (NSString *) dateFilterValue
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

    
    // loading indicator
    UIActivityIndicatorView  *av = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge] ;
    av.frame = CGRectMake(round((self.view.frame.size.width - 25) / 2), round((self.view.frame.size.height - 25) / 2), 25, 25);
    av.tag  = 1;
    [self.view addSubview:av];
    [av startAnimating];
    
    // Getting the actual series name/values for the pod
    SAxSOAPProxyGetData *request = [[SAxSOAPProxyGetData alloc]init];
    [request processRequestGetData:dateFilterValue];

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
    
    // parsing 
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
    
    // remove loading indicator
    UIActivityIndicatorView *tmpimg = (UIActivityIndicatorView *)[self.view viewWithTag:1];
    [tmpimg removeFromSuperview];
    
    // Add local filters
    // We should get them from the Congif xml properties
    // Ex: 	<Property name="OLAP_POD_GLOBAL_FILTERS" value="Indicators:Date:CustomerType:BillingType:SegmentType:CustomerOption:Gender:Age:TariffPlan:Options:Device:OS:Location:Roaming:NetworkType" />
    // However the NSXML Parser crashes because of the """"values for
    // OLAP_POD_LOCAL_TREE_FILTER_DataServicesHierarchy and for GRID_ROW_ACTIONS
    // So adding them here statically for now
    
    dNSLog(@"[SAxDSA] Add local filters");
    // For now limiting to 12 filters - we can add more later
    //  Taking out: @"Location", @"Roaming", @"Netwk Type"
    podFilters = [[NSMutableArray alloc] initWithObjects:@"Indicators", @"Date", @"Cust Type", @"BillingType", @"Segmt Type", @"Cust Option", @"Gender", @"Age", @"Tariff Plan", @"Options", @"Device", @"OS", nil];
    
    // podFilters

    [self addFilterButtons:(podFilters)];
    

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
            NSString *value = [NSString stringWithFormat:@"%0.2f %%",num];
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

    CGRect pieFrame = CGRectMake(26,110,712,830);
    shinoChart = [ShinobiChart pieChartForOSDataWithFrame:pieFrame];
    
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
    shinoChart.legend.maxSeriesPerLine = 2;
    
    shinoChart.licenseKey = licenseKey;

    shinoChart.datasource = self;
    shinoChart.delegate = self;
    //shinoChart = self;
    
    lineView = [[LineView alloc] init];
    [lineView setUserInteractionEnabled:NO];
    [lineView setBackgroundColor:[UIColor clearColor]];
    [shinoChart addSubview:lineView];
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
    pieSeries.outerRadius = 200.0f;
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

/*
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
 */

- (void)sChart:(ShinobiChart *)chart alterLabel:(UILabel *)label forDatapoint:(SChartRadialDataPoint *)datapoint atSliceIndex:(int)index inRadialSeries:(SChartRadialSeries *)series
{
    if (datapoint.value.floatValue < 2.0f) {
        label.text = @"";
    } else {
        SChartPieSeries *pieSeries = (SChartPieSeries *)series;
        
        float extrusion = 150.0f;
        //get our radial point from our datasource method
        
        // three points:
        CGPoint pieCenter;      // chart center for trig calculations
        CGPoint oldLabelCenter; // original label center
        CGPoint labelCenter;    // new label center
        CGPoint endOfLine;     // we want our line to finish just short of our label
        
        pieCenter = [pieSeries getDonutCenter];
        oldLabelCenter = labelCenter = [pieSeries getSliceCenter:index];
        
        // find the angle of the slice, and add on a little to the label's center
        float xChange, yChange;
        
        xChange = pieCenter.x - labelCenter.x;
        yChange = pieCenter.y - labelCenter.y;
        
        float angle = atan2f(xChange, yChange) + M_PI / 2.f;
        // we do the M_PI / 2 adjustment because of how the pie is drawn internally
        
        labelCenter.x = oldLabelCenter.x + extrusion * cosf(angle);
        labelCenter.y = oldLabelCenter.y - extrusion * sinf(angle);
        
        endOfLine.x = oldLabelCenter.x + (extrusion-30.f) * cosf(angle);
        endOfLine.y = oldLabelCenter.y - (extrusion-30.f) * sinf(angle);
        
        label.textColor = [UIColor whiteColor];
        [label sizeToFit];
        [label setCenter:labelCenter]; // this must be after sizeToFit
        [label setHidden:NO];
        
        // connect our old label point to our new label
        [lineView addPointPair:oldLabelCenter second:endOfLine];
    }
}

- (void) sChartRenderStarted:(ShinobiChart *)chart withFullRedraw:(BOOL)fullRedraw {
    
    //Draw our lines on if we're on our donut
    if (chart == shinoChart) {
        // position our view over the top of the GL canvas
        CGRect glFrame = chart.canvas.glView.frame;
        glFrame.origin.y = chart.canvas.frame.origin.y;
        [lineView setFrame:glFrame];
        // remove the old point-pairs from the line view
        [lineView reset];
    }
}

// Local pickers (button) to add dynamically
-(void) addFilterButtons: (NSMutableArray*) podFilter
{
    dNSLog(@"[SAxDSA] Adding Pod filters");

    int ystart = 16;
    int xstart = 26;
    int offset = 18;
    int filterRows = 1;
    
    if ([podFilter count] < 7)
        ystart = 35;
    
    int buttonWidth = 104;
    int buttonHeight = 34;
    int buttonXoffset = xstart;
    int buttonYoffset = ystart;
    int j =1;
    
    for( int i = 0; i < [podFilter count]; i++ ) {
        j = i;
        if (i < 6) {
            buttonYoffset = ystart*filterRows;
            buttonXoffset = (offset+buttonWidth)*j+xstart; 
        } else {
            buttonYoffset = ystart*2+buttonHeight-4;
            buttonXoffset = (offset+buttonWidth)*(j-6)+xstart;
        }

        CGRect buttonsFrame = CGRectMake(buttonXoffset,buttonYoffset,buttonWidth,buttonHeight);
        //dNSLog(@"[SAxDSA] CGRectMake = [%f, %f, %f, %f]", buttonsFrame.origin.x, buttonsFrame.origin.y, buttonsFrame.size.width, buttonsFrame.size.height);
        
        UIButton* filterButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [filterButton setTag:i];
        [filterButton setFrame:buttonsFrame];
        [filterButton addTarget:self action:@selector(buttonFilterClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        filterButton.backgroundColor = [UIColor darkGrayColor];

        
        filterButton.tintColor = [UIColor whiteColor];
        filterButton.layer.borderColor = [UIColor blackColor].CGColor;
        filterButton.layer.borderWidth = 0.5f;
        filterButton.layer.cornerRadius = 10.0f;
        
        [filterButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [filterButton setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        [filterButton setTitle:[podFilter objectAtIndex:i] forState:UIControlStateNormal];
        
        CAGradientLayer *gradient = [CAGradientLayer layer];
        gradient.frame = filterButton.bounds;
        gradient.colors = [NSArray arrayWithObjects:
                           (id)[[UIColor grayColor] CGColor],
                           (id)[[UIColor blackColor] CGColor], nil];
        [filterButton.layer insertSublayer:gradient atIndex:0];
        
        [self.view addSubview:filterButton];
    }

}


- (void)buttonFilterClicked:(UIButton*)button
{
    NSLog(@"[SAxDSA] Button #[%ld] Title: %@ touched", (long int)[button tag], [button titleForState:UIControlStateNormal]);
    
    if ([[button titleForState:UIControlStateNormal] isEqualToString:@"Date"])
    {
        dNSLog(@"[SAxDSA] DATE Selected");
        // Use OCCalendar control to offer the user the selection of 1 day
        // or a range of days
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        
        //Here's where the magic happens
        calVC = [[OCCalendarViewController alloc] initAtPoint:CGPointMake(167, 50) inView:self.view arrowPosition:OCArrowPositionCentered];
        calVC.delegate = self;
        
        //Test ONLY - single selection
        //calVC.selectionMode = OCSelectionSingleDate;
        
        //Now we're going to optionally set the start and end date of a pre-selected range.
        NSDateComponents *sdateParts = [[NSDateComponents alloc] init];
        [sdateParts setMonth:8];
        [sdateParts setYear:2012];
        [sdateParts setDay:6];
        
        NSDate *sDate = [calendar dateFromComponents:sdateParts];
        
        NSDateComponents *edateParts = [[NSDateComponents alloc] init];
        [edateParts setMonth:8];
        [edateParts setYear:2012];
        [edateParts setDay:6];
        
        NSDate *eDate = [calendar dateFromComponents:edateParts];
        
        [calVC setStartDate:sDate];
        [calVC setEndDate:eDate];
        
        //Add to the view.
        [self.view addSubview:calVC.view];


    }

}

// OCCalendar Delegate method

#pragma mark OCCalendarDelegate Methods

- (void)completedWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate {
    // Format the start and end dates
    NSLocale *locale = [NSLocale currentLocale];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSString *DateFormat = [NSDateFormatter dateFormatFromTemplate:@"MM/dd/yyyy" options:0 locale:locale];

    [formatter setDateFormat:DateFormat];
    
    NSLog(@"[SAxDSA] startDate:%@, endDate:%@", [formatter stringFromDate:startDate] ,
          [formatter stringFromDate:endDate]);
    
    [self showToolTip:[NSString stringWithFormat:@"%@ - %@", [formatter stringFromDate:startDate], [formatter stringFromDate:endDate]]];
    
    [calVC.view removeFromSuperview];
    
    calVC.delegate = nil;
    calVC = nil;

    // Run a new request and refresh chart
    //NSString *date = @"Days~08/07/2012~08/07/2012";
    NSString *date = [NSString stringWithFormat:@"%@%@%@%@", @"Days~",[formatter stringFromDate:startDate],@"~",[formatter stringFromDate:endDate]];
    dNSLog(@"[SAxDSA] Refreshing chart for Date: %@", date);

    [self updateChart:date];
    
}

-(void) completedWithNoSelection{
    [calVC.view removeFromSuperview];
    calVC.delegate = nil;
    calVC = nil;
}


#pragma mark -
#pragma mark Prettifying Methods...


//Create our little toast notifications.....
- (void)showToolTip:(NSString *)str {
    if(toolTipLabel) {
        [toolTipLabel removeFromSuperview];
        toolTipLabel = nil;
    }
    dNSLog(@"[SAxDSA] showToolTip");
    toolTipLabel = [ [UILabel alloc ] initWithFrame:CGRectMake(self.view.frame.size.width-260.0, self.view.frame.size.height-35.0, 250.0, 25) ];
    toolTipLabel.textColor = [UIColor whiteColor];
    toolTipLabel.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.5f];
    toolTipLabel.layer.cornerRadius = 5.0f;
    toolTipLabel.font = [UIFont fontWithName:@"Arial" size:(16.0)];
    toolTipLabel.text = str;
    
    toolTipLabel.alpha = 0.0f;
    
    [self.view addSubview:toolTipLabel];
    
    [UIView beginAnimations:@"fadeInToolTip" context:nil];
    [UIView setAnimationDuration:0.1f];
    toolTipLabel.alpha = 1.0f;
    [UIView commitAnimations];
    
    [self performSelector:@selector(fadeOutToolTip) withObject:nil afterDelay:2.5f];
}

- (void)fadeOutToolTip {
    dNSLog(@"[SAxDSA] fadeOutToolTip");
    if(toolTipLabel) {
        [UIView beginAnimations:@"fadeOutToolTip" context:nil];
        [UIView setAnimationDuration:0.1f];
        toolTipLabel.alpha = 0.0f;
        [UIView commitAnimations];
        [toolTipLabel performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:0.1f];
        
        toolTipLabel = nil;
    }
}


#pragma mark -
#pragma mark Gesture Recognizer

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    dNSLog(@"[SAxDSA] gestureRecognizer");
    CGPoint insertPoint = [touch locationInView:self.view];
    
    calVC = [[OCCalendarViewController alloc] initAtPoint:insertPoint inView:self.view arrowPosition:OCArrowPositionCentered selectionMode:OCSelectionSingleDate];
    calVC.delegate = self;
    [self.view addSubview:calVC.view];
    
    return YES;
}



@end
