//
//  SAxParserXML.m
//  SAx Lite2
//
//  Created by Fabrice Guillaume on 2/9/13.
//  Copyright (c) 2013 Fabrice Guillaume. All rights reserved.
//

#import "SAxParserXML.h"

@implementation SAxParserXML

@synthesize property, properties, metaCol, metaCols, dataRow, dataRows, dataMetaProperties;

- (SAxParserXML *) initXMLParser
{
    // init array of pods
    properties = [[NSMutableArray alloc]init];
    metaCols = [[NSMutableArray alloc] init];
    dataRows = [[NSMutableArray alloc] init];
    dataMetaProperties = [[NSMutableArray alloc] init];
    metaDataExtracted = NO;
    return self;
    
}

// Note, some property items have several "" and this causes the addObject to fail.
// Given we don't need those for the pod definition (we just need the chart type), we
// will discart them - this may need to be refactored down the road as this does not scale
// Because this parser is event driven, we can't check for ""
// Here is the error received: NSXMLParserSpaceRequiredError = 65
// Here are the 2 tags causing pb - they have a huge list of "" separated properties for
// the <value> tag
/*
<Property name="OLAP_POD_LOCAL_TREE_FILTER_DataServicesHierarchy" value="{"ID":"DataServicesHierarchy","Type":"hierarchyTree","Label":"Data Services Hierarchy","TreeIDs":"CIMXM_DATA_SERVICES_HIERARCHY","DefaultValue":"","DisplayLabel":"Data Services","MultiSelection":"true","ConnectionParentFilter":"","SynchInfo":null,"UseServerCache":true}" />
<Property name="GRID_ROW_ACTIONS" value="[{"eventType":"POD_SYNCH_ACTION","actionLabel":"Data Services Synch","actionIcon":"../GenericSkin/Img/Launchpad/generic_trigger.png","additionalInfo":"synchType=DATA_CLICK_FILTER$synchKey=SQL_DataServices_Synch","rules":[]},{"eventType":"LAUNCHPAD_ACTION","actionLabel":"Drill Down","actionIcon":"../GenericSkin/Img/Launchpad/drillDown.png","additionalInfo":{"EnabledLevels":"","Actions":[{"type":"DrillDown","drillDownEnabledLevels":"1:3","drillDownTreeFilterId":"DataServicesHierarchy","drillDownColId":"Network_id"}]},"rules":[]}]" />
<Property name="OLAP_POD_GLOBAL_FILTERS" value="Indicators:Date:CustomerType:BillingType:SegmentType:CustomerOption:Gender:Age:TariffPlan:Options:Device:OS:Location:Roaming:NetworkType" />
*/

// Parse the start of an element
- (void)parser:(NSXMLParser *)parser
            didStartElement:(NSString *)elementName
            namespaceURI:(NSString *)namespaceURI
            qualifiedName:(NSString *)qualifiedName
            attributes:(NSDictionary *)attributeDict
{
    
    if ([elementName isEqualToString:@"Property"]) {
        dNSLog(@"Property");
        // The Config xml xml looks like
        // 		<Property name="CACHE_SETTINGS" value="CONTENT_MANAGER" />

        // Extracting attributes for the property element
        
        NSLog(@"\t[SAxParser] <Property> element found");
        propertyConf = [[SAxConfigStore alloc] init];
        
        propertyConf.propertyName = [attributeDict objectForKey:@"name"];
        propertyConf.propertyValue = [attributeDict objectForKey:@"value"];
        
        dNSLog(@"\t[SAxParser]  -> name=%@", propertyConf.propertyName);
        dNSLog(@"\t[SAxParser]  -> value=%@", propertyConf.propertyValue);
    }

    if ([elementName isEqualToString:@"col"]) {
        // The Metadata xml looks like
        // 	<col id="Network_id" name="Network_id" type="number" />
        
        NSLog(@"\t[SAxParser] <col> element found");
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
        NSMutableArray *dataMetaProperties2 = [[NSMutableArray alloc]init];
        
        // We will do that just once
        if (!metaDataExtracted)
        {
            dNSLog(@"\t[SAxParser]  Extracting property names to be used in the Data section");
            dNSLog(@"\t[SAxParser]  There are %d Data properties:", [metaCols count]);

            for (int i =0; i < [metaCols count]; i++)
            {
                dNSLog(@"\t[SAxParser]   - property #%d: [%@]", i+1, [[metaCols objectAtIndex:i] metaDataId]);
                
                [dataMetaProperties addObject:(NSString *)[[metaCols objectAtIndex:i] metaDataId]];
                [dataMetaProperties2 addObject:[[metaCols objectAtIndex:i] metaDataId]];
                
                dNSLog(@"\t[SAxParser]  Adding [%@] to dataMetaProperties", [[metaCols objectAtIndex:i] metaDataId]);

            }
            metaDataExtracted = YES;
        }
        // We now have an array that can be used to parse the <Data> section of the XML
        dNSLog(@"\t[SAxParser]  %d properties added to dataMetaProperties array", [dataMetaProperties count]);
    }
    
    if ([elementName isEqualToString:@"row"]) {
        // The Data xml looks like
        // 	<row No="1" Network_id="4" service_x0020_group="Browsing"
        //  Avg_x0020_Data_x0020_Volume_x0020_per_x0020_Session_x0020__x0028_MB_x0029_="0.13"
        //  ROWID="-788535925" />
        
        NSLog(@"\t[SAxParser] <row> element found");
        dataRow = [[SAxDataStore alloc] init];

        if (!metaDataExtracted)
        {
            // We don't have the properties yet
            dNSLog(@"\t[SAxParser] Missing properties to parse the Data section");
            return;
        }
        
        // Getting the properties from the Metadata section
        // For this POC, we will keep this to 5 - may need to enhance with a loop
        dNSLog(@"\t[SAxParser] [%@]", [attributeDict objectForKey:[dataMetaProperties objectAtIndex:2]]);
        dataRow.dataPosition = [attributeDict objectForKey:[dataMetaProperties objectAtIndex:0]];
        dataRow.dataId = [attributeDict objectForKey:[dataMetaProperties objectAtIndex:1]];
        dataRow.dataSerieName = [attributeDict objectForKey:[dataMetaProperties objectAtIndex:2]];
        dataRow.dataSerieValue = [attributeDict objectForKey:[dataMetaProperties objectAtIndex:3]];

        dataRow.dataRowId = [attributeDict objectForKey:[dataMetaProperties objectAtIndex:4]];
        
        //dNSLog(@"\t[SAxParser]  -> dataPosition=%@", dataRow.dataPosition);
        //dNSLog(@"\t[SAxParser]  -> dataId=%@", dataRow.dataId);
        dNSLog(@"\t[SAxParser]  -> dataSerieName=%@", dataRow.dataSerieName);
        dNSLog(@"\t[SAxParser]  -> dataSerieValue=%@", dataRow.dataSerieValue);
        //dNSLog(@"\t[SAxParser]  -> dataRowId=%@", dataRow.dataRowId);
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
    
    if ([elementName isEqualToString:@"GetData"] ||
        [elementName isEqualToString:@"DataProviderConfig"])
    {
        // We reached the end of the XML document: </DataProviderConfig> or </GetData>
        dNSLog(@"\t[SAxParser] Parsing finished");
        return;
    }
    
    
    if ([elementName isEqualToString:@"Property"])
    {
        // We are done with property entry – add the parsed property
        // object to our properties array
        if (propertyConf) // add this check to not add the GRID_ROW_ACTIONS property
        {
            [properties addObject:propertyConf];
            dNSLog(@"\t[SAxParser]  -> property added - properties count: %d", [properties count]);
        }
        
        // release user object
        property = nil;

    } else if ([elementName isEqualToString:@"col"])
    {
        // We are done with col entry – add the parsed col
        // object to our col array
        [metaCols addObject:metaCol];
        dNSLog(@"\t[SAxParser]  -> metaCol added - metaCols count: %d", [metaCols count]);
        
        // release user object
        metaCol = nil;
        
    } else if ([elementName isEqualToString:@"row"])
    {
        // We are done with row entry – add the parsed row
        // object to our row array
        [dataRows addObject:dataRow];
        dNSLog(@"\t[SAxParser]  -> dataRow added - dataRows count: %d", [dataRows count]);
        
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

// Error delegates methods
- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError{
    NSLog(@"\t[SAxParser] Error %i, Description: %@, Line: %i, Column: %i", [parseError code],
          [[parser parserError] localizedDescription], [parser lineNumber],
          [parser columnNumber]);
    
}

- (void)parser:(NSXMLParser *)parser validationErrorOccurred:(NSError *)validError{
    NSLog(@"\t[SAxParser] valid Error: %@", validError);
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
