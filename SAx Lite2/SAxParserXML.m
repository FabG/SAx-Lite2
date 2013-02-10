//
//  SAxParserXML.m
//  SAx Lite2
//
//  Created by Fabrice Guillaume on 2/9/13.
//  Copyright (c) 2013 Fabrice Guillaume. All rights reserved.
//

#import "SAxParserXML.h"

@implementation SAxParserXML
-(void) parse: (NSData *)xmlData
{
    dNSLog(@"[SAxParser] Start Parsing...");
    // Create the parser object with the data received from the web service
    NSXMLParser *parser = [[ NSXMLParser alloc] initWithData:xmlData];
    
    // Give it a delegate - ignore the warning here for now
    [parser setDelegate:self];
    
    // Tell it to start parsing - the document will be parsed and
    // the delegate of NSXMLParser will get all of its delegate messages
    // sent to it before this line finishes execution - it is blocking
    [parser parse];
    
    // Get rid of the XML data as we no longer need it
    xmlData = nil;

}

// delegate method
// We will look for the following elements and add them to a mutable array
// Elements:
// "col": the 3rd gives the Pod Title
// "row": the 3rd provides the Measure name and the 4th the Measure Value

- (void) parser:( NSXMLParser *) parser
                didStartElement:( NSString *)elementName
                namespaceURI:( NSString *) namespaceURI
                qualifiedName:( NSString *) qualifiedName
                attributes:( NSDictionary *) attributeDict
{
    NSLog(@"[SAxParser]  -> %@ found a %@ element", self, elementName);

    if ([ elementName isEqual:@"MetaData"])
    {
        // If the parser saw a channel, create new instance, store in our ivar
        metadata = [[NSMutableString alloc] init];
        
        // Add the item to our array and release our hold on it
        [metadata appendString:elementName];
        NSLog(@"[SAxParser]  -> Start MetaData: %@", metadata);
    }
}

- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
{
    NSLog(@"[SAxParser] parser:didEndElement");
    // If we were in an element that we were collecting the string for,
    // this appropriately releases our hold on it and the permanent ivar keeps
    // ownership of it. If we weren't parsing such an element, currentString
    // is nil already.
    currentString = nil;
    
    // If the element that ended was the channel, give up control to
    // who gave us control in the first place
    /*
    if ([elementName isEqual:@"channel"]) {
        [parser setDelegate:parentParserDelegate];
        [self trimItemTitles];
    
     }
     */
    NSLog(@"[SAxParser]  -> Finish MetaData: %@", metadata);
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)str
{
    [currentString appendString:str];
}


    
/* XML Response received
 <GetData>
 <MetaData>
 <Columns>
 col id="No" name="No" type="number" />
 <col id="Network_id" name="Network_id" type="number" />
 <col id="service_x0020_group" name="service group" type="string" />
 <col id="Avg_x0020_Data_x0020_Volume_x0020_per_x0020_Session_x0020__x0028_MB_x0029_" name="Avg Data Volume per Session (MB)" type="number" />
 <col id="ROWID" name="ROWID" type="string" />
 </Columns>
 <Pagination actualPage="1" totalRowCount="6" totalPages="1" pageSize="25" />
 <AdditionalProperties>
 <AdditionalProperty name="ROWNUM_COLID" value="No" />
 </AdditionalProperties>
 </MetaData>
 <Data>
 <row No="1" Network_id="4" service_x0020_group="Browsing" Avg_x0020_Data_x0020_Volume_x0020_per_x0020_Session_x0020__x0028_MB_x0029_="0.13" ROWID="-788535925" />
 <row No="2" Network_id="3" service_x0020_group="Streaming" Avg_x0020_Data_x0020_Volume_x0020_per_x0020_Session_x0020__x0028_MB_x0029_="1.98" ROWID="1697245990" />
 <row No="3" Network_id="6" service_x0020_group="Communication / Messaging" Avg_x0020_Data_x0020_Volume_x0020_per_x0020_Session_x0020__x0028_MB_x0029_="0.01" ROWID="-979132663" />
 <row No="4" Network_id="5" service_x0020_group="Download / Upload / Gaming" Avg_x0020_Data_x0020_Volume_x0020_per_x0020_Session_x0020__x0028_MB_x0029_="0.47" ROWID="-876054502" />
 <row No="5" Network_id="1" service_x0020_group="Others" Avg_x0020_Data_x0020_Volume_x0020_per_x0020_Session_x0020__x0028_MB_x0029_="0.01" ROWID="1497011326" />
 <row No="6" Network_id="2" service_x0020_group="Mail" Avg_x0020_Data_x0020_Volume_x0020_per_x0020_Session_x0020__x0028_MB_x0029_="0.08" ROWID="-867832989" />
 </Data>
 </GetData>
 
 */
 
@end
