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
@synthesize buttonCIA, buttonCOA, buttonDA, buttonDSA, buttonTPA, buttonUR;

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
    
    [self applyIconsButtons];


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

- (void)applyIconsButtons {
    // Remove static titles from storyboard for each button (6 or now)
    NSArray *buttonArray = [[NSArray alloc] initWithObjects:buttonDSA,buttonTPA,buttonDA,buttonCIA,buttonCOA,buttonUR,nil];
    NSArray *imageNameArrayCode = [[NSArray alloc] initWithObjects:@"DSA", @"TPA", @"DA", @"CIA", @"COA", @"UR", nil];
    NSString *imageNamePrefix = @"SAxM_Launch_Pad_";
    NSString *imageNamePostfix = @"_150x150.png";
    NSString *imageSelNamePostfix = @"_150x150_sel.png";
    
    UIButton *button;
    for (int i = 0; i < buttonArray.count; i++) {
        button = [buttonArray objectAtIndex:i];
        [button setTitle:nil forState:UIControlStateNormal];
    }
    
    // Apply images to buttons
    // Icons - normal
    for (int i = 0; i < buttonArray.count; i++) {
        button = [buttonArray objectAtIndex:i];
        NSString *imageName = [NSString stringWithFormat:@"%@%@%@",
                               imageNamePrefix,
                               [imageNameArrayCode objectAtIndex:i],
                               imageNamePostfix];
                               
        NSLog(@"Image name: %@", imageName);
        
        [button setImage: [UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    
    // Icons - selected
    for (int i = 0; i < buttonArray.count; i++) {
        button = [buttonArray objectAtIndex:i];
        NSString *imageName = [NSString stringWithFormat:@"%@%@%@",
                               imageNamePrefix,
                               [imageNameArrayCode objectAtIndex:i],
                               imageSelNamePostfix];
        
        NSLog(@"Selected Image name: %@", imageName);
        
        [button setImage: [UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
}


@end
