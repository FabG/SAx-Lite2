//
//  SAxViewController.m
//  SAx Lite2
//
//  Created by Fabrice Guillaume on 2/4/13.
//  Copyright (c) 2013 Fabrice Guillaume. All rights reserved.
//

#import "SAxViewController.h"

@interface SAxViewController ()

@end

@implementation SAxViewController
@synthesize buttonSAxMLaunch;
@synthesize buttonSAxCLaunch;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [[self buttonSAxMLaunch] setImage: [UIImage imageNamed:@"SAxM_238x31.png"] forState:UIControlStateNormal];
    [[self buttonSAxCLaunch] setImage: [UIImage imageNamed:@"SAxC_238x31.png"] forState:UIControlStateNormal];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    //[self navigationController ]
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return (interfaceOrientation == UIInterfaceOrientationMaskAllButUpsideDown);
}

@end
