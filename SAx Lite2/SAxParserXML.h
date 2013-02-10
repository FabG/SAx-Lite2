//
//  SAxParserXML.h
//  SAx Lite2
//
//  Created by Fabrice Guillaume on 2/9/13.
//  Copyright (c) 2013 Fabrice Guillaume. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SAxParserXML : NSObject < NSXMLParserDelegate >
{
    NSMutableString *currentString;
    NSMutableString *metadata;
    NSMutableString *data;
    NSMutableString *SeriesTitle;
    NSMutableString *SeriesName;
    NSMutableArray *SeriesValue;
}

-(void) parse: (NSData *)xmlData;
- (void) parser:( NSXMLParser *) parser
            didStartElement:( NSString *)elementName
            namespaceURI:( NSString *) namespaceURI
            qualifiedName:( NSString *) qualifiedName
     attributes:( NSDictionary *) attributeDict;

@end
