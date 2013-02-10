//
//  SAxParserXML.h
//  SAx Lite2
//
//  Created by Fabrice Guillaume on 2/9/13.
//  Copyright (c) 2013 Fabrice Guillaume. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SAxPodStore;

@interface SAxParserXML : NSObject
{
    // an ad hoc string to hold element value
    NSMutableString *currentElementValue;
    
    // pod object
    SAxPodStore *pod;
    
    // array of pod objects
    NSMutableArray *pods;
}

@property (nonatomic, retain) SAxPodStore *pod;
@property (nonatomic, retain) NSMutableArray *pods;

- (SAxParserXML *) initXMLParser;
//- (void) doParseXML:(NSData *)data;

@end
