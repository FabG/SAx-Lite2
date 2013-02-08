//
//  SAxDSAViewController.m
//  SAx Lite2
//
//  Created by Fabrice Guillaume on 2/6/13.
//  Copyright (c) 2013 Fabrice Guillaume. All rights reserved.
//

#import "SAxDSAViewController.h"
#import "SAxDSAPodTableViewController.h"


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
    // Enter License key
    NSString *licenseKey = @"nwDHpmTwf5m31Y1MjAxMzAzMDlpbmZvQHNoaW5vYmljb250cm9scy5jb20=H35vNDlBhAc2WsUagWgYGOYIElNwXCIbtXSnnrPAt2vUOb8byKV52ZHv/0OaY1pgtnFe+ecC6AhgLA0ab3IXUFf1AtxMeCVXSIilzFm132O26DRjsu+q9Sk8RD7gnujMe5eHaAq8OTu/ajCo3brIhO3opGxs=BQxSUisl3BaWf/7myRmmlIjRnMU2cA7q+/03ZX9wdj30RzapYANf51ee3Pi8m2rVW6aD7t6Hi4Qy5vv9xpaQYXF5T7XzsafhzS3hbBokp36BoJZg8IrceBj742nQajYyV7trx5GIw9jy/V6r0bvctKYwTim7Kzq+YPWGMtqtQoU=PFJTQUtleVZhbHVlPjxNb2R1bHVzPnh6YlRrc2dYWWJvQUh5VGR6dkNzQXUrUVAxQnM5b2VrZUxxZVdacnRFbUx3OHZlWStBK3pteXg4NGpJbFkzT2hGdlNYbHZDSjlKVGZQTTF4S2ZweWZBVXBGeXgxRnVBMThOcDNETUxXR1JJbTJ6WXA3a1YyMEdYZGU3RnJyTHZjdGhIbW1BZ21PTTdwMFBsNWlSKzNVMDg5M1N4b2hCZlJ5RHdEeE9vdDNlMD08L01vZHVsdXM+PEV4cG9uZW50PkFRQUI8L0V4cG9uZW50PjwvUlNBS2V5VmFsdWU+";
    
    chart = [[ShinobiChart alloc] initWithFrame:self.view.bounds];
    chart.title = @"My first chart";
    
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
