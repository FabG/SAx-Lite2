//
//  SAxParserXML.m
//  SAx Lite2
//
//  Created by Fabrice Guillaume on 2/9/13.
//  Copyright (c) 2013 Fabrice Guillaume. All rights reserved.
//

#import "SAxParserXML.h"
#import "SAxPodStore.h"

@implementation SAxParserXML

@synthesize pod, pods;

- (SAxParserXML *) initXMLParser
{
    // init array of pods
    pods = [[NSMutableArray alloc] init];
    return self;
    
}

// Parse the start of an element
- (void)parser:(NSXMLParser *)parser
            didStartElement:(NSString *)elementName
            namespaceURI:(NSString *)namespaceURI
            qualifiedName:(NSString *)qualifiedName
            attributes:(NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:@"col"]) {
        // Our xml looks like
        // 	<col id="Network_id" name="Network_id" type="number" />
        
        NSLog(@"\t[SAxParser] col element found – create a new instance...");
        pod = [[SAxPodStore alloc] init];
        
        //We do not have any attributes in the user elements, but if
        // you do, you can extract them here:
        // user.att = [[attributeDict objectForKey:@"<att name>"] ...];                                                 
        pod.metaDataId = [attributeDict objectForKey:@"id"];
        pod.metaDataName = [attributeDict objectForKey:@"name"];
        pod.metaDataType = [attributeDict objectForKey:@"type"];
        
        dNSLog(@"\t[SAxParser]  -> id=%@", pod.metaDataId);
        dNSLog(@"\t[SAxParser]  -> name=%@", pod.metaDataName);
        dNSLog(@"\t[SAxParser]  -> type=%@", pod.metaDataType);
    }
    
}

// Parse an element value
- (void)parser:(NSXMLParser *)parser
            foundCharacters:(NSString *)string
{
    if (!currentElementValue)
    {
        // init the ad hoc string with the value
        currentElementValue = [[NSMutableString alloc] initWithString:string];
    } else
    {
        // append value to the ad hoc string
        [currentElementValue appendString:string];
    }
    dNSLog(@"\t[SAxParser]  -> Processing value for : %@", string);

}

// Parse the end of an element
- (void)parser:(NSXMLParser *)parser
            didEndElement:(NSString *)elementName
            namespaceURI:(NSString *)namespaceURI
            qualifiedName:(NSString *)qName
{
    
    if ([elementName isEqualToString:@"GetData"]) {
        // We reached the end of the XML document: </GetData>
        dNSLog(@"\t[SAxParser] Parsing finished");
        return;
    }
    
    if ([elementName isEqualToString:@"col"]) {
        // We are done with col entry – add the parsed col
        // object to our pod array
        [pods addObject:pod];
        dNSLog(@"\t[SAxParser]  -> pod added. Pod count#%d", [pods count]);
        
        // release user object
        pod = nil;

    } else
    {
        // The parser hit one of the element values.
        // This syntax is possible because User object
        // property names match the XML user element names
        [pod setValue:currentElementValue forKey:elementName];
    }
    
    currentElementValue = nil;
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
