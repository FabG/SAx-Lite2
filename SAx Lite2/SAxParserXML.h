//
//  SAxParserXML.h
//  SAx Lite2
//
//  Created by Fabrice Guillaume on 2/9/13.
//  Copyright (c) 2013 Fabrice Guillaume. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SAxMetadataStore.h"
#import "SAxConfigStore.h"
#import "SAxDataStore.h"

@class SAxMetadataStore;

@interface SAxParserXML : NSObject
{
    // an ad hoc string to hold element value
    NSMutableString *currentElementValue;
    
    // property object
    SAxConfigStore *propertyConf;
    
    // array of property objects
    NSMutableArray *properties;
    
    // col object
    SAxMetadataStore *metaCol;
    
    // array of col objects
    NSMutableArray *metaCols;
    
    // row object
    SAxDataStore *dataRow;
    
    // array of row objects
    NSMutableArray *dataRows;
    
    Boolean metaDataExtracted;
    NSMutableArray * dataMetaProperties;
    
}

@property (nonatomic, retain) SAxConfigStore *property;
@property (nonatomic, retain) NSMutableArray *properties;
@property (nonatomic, retain) SAxMetadataStore *metaCol;
@property (nonatomic, retain) NSMutableArray *metaCols;
@property (nonatomic, retain) SAxDataStore *dataRow;
@property (nonatomic, retain) NSMutableArray *dataRows;
@property (nonatomic, retain) NSMutableArray *dataMetaProperties;

- (SAxParserXML *) initXMLParser;


@end
