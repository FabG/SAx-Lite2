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

@property (nonatomic, retain) NSMutableString *dataPosition;
@property (nonatomic, retain) NSMutableString *dataId;
@property (nonatomic, retain) NSMutableString *dataSerieName;
@property (nonatomic, retain) NSMutableString *dataSerieValue;
@property (nonatomic, retain) NSMutableString *dataRowId;

@end
