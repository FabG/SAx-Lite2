//
//  SAxMLaunchController.m
//  SAx Lite2
//
//  Created by Fabrice Guillaume on 2/4/13.
//  Copyright (c) 2013 Fabrice Guillaume. All rights reserved.
//

#import "SAxMLaunchController.h"
#import "SAxAppDelegate.h"
@interface SAxMLaunchController ()

@end

@implementation SAxMLaunchController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backHome:(id)sender {
    NSLog(@"Back pressed");
    [self dismissViewControllerAnimated:YES completion:NULL];
}
@end
