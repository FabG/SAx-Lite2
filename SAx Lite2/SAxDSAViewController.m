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
    
    dNSLog(@"Shinobi License expiration Date: %@", licenseDate);

    chart = [[ShinobiChart alloc] initWithFrame:self.view.bounds];
    
    if (licenseKey)
    {
        chart.title = podName;
        chart.theme.chartTitleStyle.position = SChartTitlePositionCenter;

    }
    else
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
    chart.delegate = self;
    
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

@end
