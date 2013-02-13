//
//  ShinobiChart+PieCharts.m
//  SAx Lite2
//
//  Created by Fabrice Guillaume on 2/12/13.
//  Copyright (c) 2013 Fabrice Guillaume. All rights reserved.
//

#import "ShinobiChart+PieCharts.h"

@implementation ShinobiChart (PieCharts)


+ (ShinobiChart*)pieChartForOSDataWithFrame:(CGRect)frame {
    BOOL iPad = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
    ShinobiChart *chart = [[ShinobiChart alloc] initWithFrame:frame];
    chart.autoresizingMask = ~UIViewAutoresizingNone;
    
    SChartDarkTheme *d = [SChartDarkTheme new];
    if (!iPad) {
        d.legendStyle.font = [UIFont fontWithName:d.lightFontName size:13.f];
    }
    chart.theme = d;
    
    
    chart.legend.hidden = NO;
    chart.legend.position = SChartLegendPositionBottomMiddle;
    chart.legend.maxSeriesPerLine = iPad ? 1 : 2;
    
    
    return chart;
}

+ (ShinobiChart*)donutChartForOSVersionDataWithFrame:(CGRect)frame {
    
    ShinobiChart *chart = [[ShinobiChart alloc] initWithFrame:frame];
    chart.autoresizingMask = ~UIViewAutoresizingNone;
    
    chart.theme = [SChartDarkTheme new];
    
    chart.legend.hidden = NO;
    chart.legend.position = SChartLegendPositionBottomMiddle;
    chart.legend.maxSeriesPerLine = 2;
    
    return chart;
}

- (SChartPieSeries*)pieSeriesForOS {
    BOOL iPad = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
    SChartPieSeries *p = [SChartPieSeries new];
    p.selectedStyle.protrusion = iPad ? 40.f : 10.f;
    p.style.showCrust = NO;
    p.selectedStyle.showCrust = NO;
    p.labelFormatString = @"%.0f%%";
    p.selectedPosition = [NSNumber numberWithFloat:-M_PI/2.f];
    return p;
}

- (SChartDonutSeries*)donutSeriesForOSVerison {
    SChartDonutSeries *d = [SChartDonutSeries new];
    d.style.showCrust = NO;
    d.selectedStyle.showCrust = NO;
    d.labelFormatString = @"%.0f%%";
    d.style.labelFont = [UIFont fontWithName:self.theme.lightFontName size:16.f];
    d.outerRadius = 105.f;
    d.innerRadius = 65.f;
    d.selectedStyle.protrusion = 0.f;
    return d;
}



@end
