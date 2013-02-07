//
//  SAxDSAPodTableViewController.h
//  SAx Lite2
//
//  Created by Fabrice Guillaume on 2/6/13.
//  Copyright (c) 2013 Fabrice Guillaume. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface SAxDSAPodTableViewController : UITableViewController 

@property (nonatomic, retain) NSDictionary *dashboardPods;

@end


@protocol dismissDelegate <NSObject>

-(void)didTap;

@end