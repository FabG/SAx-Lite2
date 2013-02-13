//
//  ShinobiChart+PieCharts.h
//  SAx Lite2
//
//  Created by Fabrice Guillaume on 2/12/13.
//  Copyright (c) 2013 Fabrice Guillaume. All rights reserved.
//

#import <ShinobiCharts/ShinobiChart.h>

@interface ShinobiChart (PieCharts)

+ (ShinobiChart*)pieChartForOSDataWithFrame:(CGRect)frame;
+ (ShinobiChart*)donutChartForOSVersionDataWithFrame:(CGRect)frame;

- (SChartPieSeries*)pieSeriesForOS;
- (SChartDonutSeries*)donutSeriesForOSVerison;

@end
