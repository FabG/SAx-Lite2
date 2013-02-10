//
//  SAxDataStore.h
//  SAx Lite2
//
//  Created by Fabrice Guillaume on 2/10/13.
//  Copyright (c) 2013 Fabrice Guillaume. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SAxDataStore : NSObject
{
    // Data properties
    NSMutableString *dataPosition;
    NSMutableString *dataId;
    NSMutableString *dataSerieName;
    NSMutableString *dataSerieValue;
    NSMutableString *dataRowId;
    
}

@property (nonatomic, retain) NSString *dataPosition;
@property (nonatomic, retain) NSString *dataId;
@property (nonatomic, retain) NSString *dataSerieName;
@property (nonatomic, retain) NSString *dataSerieValue;
@property (nonatomic, retain) NSString *dataRowId;

@end
