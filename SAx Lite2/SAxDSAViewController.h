//
//  SAxDSAViewController.h
//  SAx Lite2
//
//  Created by Fabrice Guillaume on 2/6/13.
//  Copyright (c) 2013 Fabrice Guillaume. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SAxDSAPodTableViewController.h"

@interface SAxDSAViewController : UIViewController <DismissDelegate, UIPopoverControllerDelegate> ;

@property (strong,nonatomic) UIPopoverController *popover;

@property (nonatomic, strong) NSMutableArray *listPods;

- (IBAction)buttonPodListTapped:(id)sender;


@end
