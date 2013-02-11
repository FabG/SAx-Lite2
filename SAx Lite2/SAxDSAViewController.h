//
//  SAxDSAViewController.h
//  SAx Lite2
//
//  Created by Fabrice Guillaume on 2/6/13.
//  Copyright (c) 2013 Fabrice Guillaume. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SAxDSAPodTableViewController.h"
#import <ShinobiCharts/ShinobiChart.h>


@interface SAxDSAViewController : UIViewController <DismissDelegate, UIPopoverControllerDelegate, SChartDatasource>
{
    ShinobiChart *chart;
    NSUInteger seriesPointsCount;
}
@property (strong,nonatomic) UIPopoverController *popover;
@property (nonatomic, strong) NSString *podName;
@property (nonatomic, weak) IBOutlet UILabel *labelSAx;
@property (nonatomic, strong) NSMutableArray *seriesPointsNames;
@property (nonatomic, strong) NSMutableArray *seriesPointsValues;
//@property (strong, nonatomic) ShinobiChart *chart;

- (IBAction) buttonPodListTapped:(id)sender;
- (void) drawPieChart;
- (void) updateChart;

@end
