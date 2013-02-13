//
//  SAxConfigStore.h
//  SAx Lite2
//
//  Created by Fabrice Guillaume on 2/11/13.
//  Copyright (c) 2013 Fabrice Guillaume. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SAxConfigStore : NSObject
{
    // CONFIG properties
    NSMutableString *propertyName;
    NSMutableString *propertyValue;
    
}

@property (nonatomic, retain) NSMutableString *propertyName;
@property (nonatomic, retain) NSMutableString *propertyValue;

@end
