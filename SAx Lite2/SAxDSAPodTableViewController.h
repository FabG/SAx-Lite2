//
//  SAxDSAPodTableViewController.h
//  SAx Lite2
//
//  Created by Fabrice Guillaume on 2/6/13.
//  Copyright (c) 2013 Fabrice Guillaume. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DismissDelegate <NSObject>

-(void)dismissPopover:(NSString *)selectedPod;

@end


@interface SAxDSAPodTableViewController : UITableViewController

@property (nonatomic, assign) id <DismissDelegate> delegate;


@property (nonatomic, retain) NSDictionary *dashboardPods;


@end

