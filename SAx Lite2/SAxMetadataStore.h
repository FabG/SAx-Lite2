//
//  SAxMetadaStore.h
//  SAx Lite2
//
//  Created by Fabrice Guillaume on 2/10/13.
//  Copyright (c) 2013 Fabrice Guillaume. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SAxMetadataStore : NSObject
{
    // MetaData properties
    NSMutableString *metaDataId;
    NSMutableString *metaDataName;
    NSMutableString *metaDataType;

}

@property (nonatomic, retain) NSString *col;
@property (nonatomic, retain) NSString *row;

@property (nonatomic, retain) NSString *metaDataId;
@property (nonatomic, retain) NSString *metaDataName;
@property (nonatomic, retain) NSString *metaDataType;

@end
