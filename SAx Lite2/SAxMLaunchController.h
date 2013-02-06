//
//  SAxMLaunchController.h
//  SAx Lite2
//
//  Created by Fabrice Guillaume on 2/4/13.
//  Copyright (c) 2013 Fabrice Guillaume. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SAxMLaunchController : UIViewController

- (void)applyIconsButtons;

@property (weak, nonatomic) IBOutlet UIButton *buttonDSA;
@property (weak, nonatomic) IBOutlet UIButton *buttonTPA;
@property (weak, nonatomic) IBOutlet UIButton *buttonDA;
@property (weak, nonatomic) IBOutlet UIButton *buttonCIA;
@property (weak, nonatomic) IBOutlet UIButton *buttonCOA;
@property (weak, nonatomic) IBOutlet UIButton *buttonUR;

- (IBAction)buttonBackTouched:(id)sender;

- (IBAction)buttonDSATouched:(id)sender;

@end
