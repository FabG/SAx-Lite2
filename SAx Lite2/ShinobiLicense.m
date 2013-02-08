//
//  ShinobiLicense.m
//  SAx Lite2
//
//  Created by Fabrice Guillaume on 2/8/13.
//  Copyright (c) 2013 Fabrice Guillaume. All rights reserved.
//

#import "ShinobiLicense.h"

@implementation ShinobiLicense

+ (NSString *)getShinobiLicenseKey
{
    /* Using a plist file to keep a hold of the Shinobi License key,
     which is required to run this demo.
     */
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ShinobiSettings" ofType:@"plist"];
    NSDictionary *settings = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSString *key = settings[@"ShinobiChartsLicenseKey"];

    return key;

    
    // If you don't want to use the sample plist provided, pop your code below
    // return @"YOUR CODE HERE";
}

+ (NSDate *)getShinobiLicenseDate
{
    /* We've used a plist file to keep a hold of the Shinobi License key,
     which is required when you run a demo. You can either create yourself
     your own plist file and put the key you have been provided in there,
     at the root level, with the key "ShinobiChartsLicenseKey", or alternatively
     you can just make this method return it.
     */
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ShinobiSettings" ofType:@"plist"];
    NSDictionary *settings = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSDate *key = settings[@"ShinobiChartsLicenseValidUntil"];

    return key;
    
}

@end
