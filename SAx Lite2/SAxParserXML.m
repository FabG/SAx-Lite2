//
//  SAxParserXML.m
//  SAx Lite2
//
//  Created by Fabrice Guillaume on 2/9/13.
//  Copyright (c) 2013 Fabrice Guillaume. All rights reserved.
//

#import "SAxParserXML.h"

@implementation SAxParserXML

@synthesize metaCol, metaCols, dataRow, dataRows, dataProperties;

- (SAxParserXML *) initXMLParser
{
    // init array of pods
    metaCols = [[NSMutableArray alloc] init];
    dataRows = [[NSMutableArray alloc] init];
    dataProperties = [[NSMutableArray alloc] init];
    metaDataExtracted = NO;
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
        metaCol = [[SAxMetadataStore alloc] init];
        
        // Extracting attributes for the col element                                            
        metaCol.metaDataId = [attributeDict objectForKey:@"id"];
        metaCol.metaDataName = [attributeDict objectForKey:@"name"];
        metaCol.metaDataType = [attributeDict objectForKey:@"type"];
        
        dNSLog(@"\t[SAxParser]  -> id=%@", metaCol.metaDataId);
        dNSLog(@"\t[SAxParser]  -> name=%@", metaCol.metaDataName);
        dNSLog(@"\t[SAxParser]  -> type=%@", metaCol.metaDataType);
    }
    
    if ([elementName isEqualToString:@"Data"]) {
        NSLog(@"\t[SAxParser] Data element found – create a new instance...");
        
        
        // Extracting attributes for the row element
        // Note that the properties come from the Metadata section
        // An the metadata section always comes first so we can loop through it
        // to extract the property names. Example: No, Network-id, service_x0020_group,...
        NSMutableArray *dataProperties2 = [[NSMutableArray alloc]init];
        
        // We will do that just once
        if (!metaDataExtracted)
        {
            dNSLog(@"\t[SAxParser]  Extracting property names to be used in the Data section");
            dNSLog(@"\t[SAxParser]  There are %d Data properties:", [metaCols count]);

            for (int i =0; i < [metaCols count]; i++)
            {
                dNSLog(@"\t[SAxParser]   - property #%d: [%@]", i+1, [[metaCols objectAtIndex:i] metaDataId]);
                
                [dataProperties addObject:(NSString *)[[metaCols objectAtIndex:i] metaDataId]];
                [dataProperties2 addObject:[[metaCols objectAtIndex:i] metaDataId]];
                
                dNSLog(@"\t[SAxParser]  Adding [%@] to dataProperties", [[metaCols objectAtIndex:i] metaDataId]);

            }
            metaDataExtracted = YES;
        }
        // We now have an array that can be used to parse the <Data> section of the XML
        dNSLog(@"\t[SAxParser]  %d properties added to dataProperties array", [dataProperties count]);
    }
    
    if ([elementName isEqualToString:@"row"]) {
        // Our xml looks like
        // 	<row No="1" Network_id="4" service_x0020_group="Browsing"
        //  Avg_x0020_Data_x0020_Volume_x0020_per_x0020_Session_x0020__x0028_MB_x0029_="0.13"
        //  ROWID="-788535925" />
        
        NSLog(@"\t[SAxParser] row element found – create a new instance...");
        dataRow = [[SAxDataStore alloc] init];

        if (!metaDataExtracted)
        {
            // We don't have the properties yet
            dNSLog(@"\t[SAxParser] Missing properties to parse the Data section");
            return;
        }
        
        // Getting the properties from the Metadata section
        // For this POC, we will keep this to 5 - may need to enhance with a loop
        dNSLog(@"\t[SAxParser] [%@]", [attributeDict objectForKey:[dataProperties objectAtIndex:2]]);
        dataRow.dataPosition = [attributeDict objectForKey:[dataProperties objectAtIndex:0]];
        dataRow.dataId = [attributeDict objectForKey:[dataProperties objectAtIndex:1]];
        dataRow.dataSerieName = [attributeDict objectForKey:[dataProperties objectAtIndex:2]];
        dataRow.dataSerieValue = [attributeDict objectForKey:[dataProperties objectAtIndex:3]];
        dataRow.dataRowId = [attributeDict objectForKey:[dataProperties objectAtIndex:4]];
        
        dNSLog(@"\t[SAxParser]  -> dataPosition=%@", dataRow.dataPosition);
        dNSLog(@"\t[SAxParser]  -> dataId=%@", dataRow.dataId);
        dNSLog(@"\t[SAxParser]  -> dataSerieName=%@", dataRow.dataSerieName);
        dNSLog(@"\t[SAxParser]  -> dataSerieValue=%@", dataRow.dataSerieValue);
        dNSLog(@"\t[SAxParser]  -> dataRowId=%@", dataRow.dataRowId);
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
        // object to our col array
        [metaCols addObject:metaCol];
        dNSLog(@"\t[SAxParser]  -> metaCol added. metaCols count: %d", [metaCols count]);
        
        // release user object
        metaCol = nil;

    } else if ([elementName isEqualToString:@"row"]) {
        // We are done with row entry – add the parsed row
        // object to our row array
        [dataRows addObject:dataRow];
        dNSLog(@"\t[SAxParser]  -> dataRow added. dataRows count: %d", [dataRows count]);
        
        // release user object
        metaCol = nil;
        
    } else
    {
        // The parser hit one of the element values.
        // This syntax is possible because User object
        // property names match the XML user element names
        [metaCol setValue:currentElementValue forKey:elementName];
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
