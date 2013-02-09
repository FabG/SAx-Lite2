#import "tns2.h"
#import <libxml/xmlstring.h>
#if TARGET_OS_IPHONE
#import <CFNetwork/CFNetwork.h>
#endif
@implementation tns2_ArrayOfstring
- (id)init
{
	if((self = [super init])) {
		string = [[NSMutableArray alloc] init];
	}
	
	return self;
}
- (void)dealloc
{
	if(string != nil) [string release];
	
	[super dealloc];
}
- (NSString *)nsPrefix
{
	return @"tns2";
}
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName
{
	xmlNodePtr root = xmlDocGetRootElement(doc);
	
	xmlNsPtr xsi = xmlSearchNs(doc, root, (const xmlChar*)"xsi");
	
	xmlNodePtr node = xmlNewDocNode(doc, NULL, (const xmlChar*)[elName UTF8String], NULL);
	xmlSetNsProp(node, xsi, (const xmlChar*)"type", (const xmlChar*)"tns2:ArrayOfstring");
	xmlSetNsProp(node, nil, (const xmlChar*)"xmlns", (const xmlChar*)"http://schemas.microsoft.com/2003/10/Serialization/Arrays");
	
	[self addAttributesToNode:node];
	
	[self addElementsToNode:node];
	
	return node;
}
- (void)addAttributesToNode:(xmlNodePtr)node
{
	
}
- (void)addElementsToNode:(xmlNodePtr)node
{
	
	if(self.string != 0) {
		for(NSString * child in self.string) {
			xmlAddChild(node, [child xmlNodeForDoc:node->doc elementName:@"string"]);
		}
	}
}
/* elements */
@synthesize string;
- (void)addString:(NSString *)toAdd
{
	if(toAdd != nil) [string addObject:toAdd];
}
/* attributes */
- (NSDictionary *)attributes
{
	NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
	
	return attributes;
}
+ (tns2_ArrayOfstring *)deserializeNode:(xmlNodePtr)cur
{
	tns2_ArrayOfstring *newObject = [[tns2_ArrayOfstring new] autorelease];
	
	[newObject deserializeAttributesFromNode:cur];
	[newObject deserializeElementsFromNode:cur];
	
	return newObject;
}
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur
{
}
- (void)deserializeElementsFromNode:(xmlNodePtr)cur
{
	
	
	for( cur = cur->children ; cur != NULL ; cur = cur->next ) {
		if(cur->type == XML_ELEMENT_NODE) {
			xmlChar *elementText = xmlNodeListGetString(cur->doc, cur->children, 1);
			NSString *elementString = nil;
			
			if(elementText != NULL) {
				elementString = [NSString stringWithCString:(char*)elementText encoding:NSUTF8StringEncoding];
				[elementString self]; // avoid compiler warning for unused var
				xmlFree(elementText);
			}
			if(xmlStrEqual(cur->name, (const xmlChar *) "string")) {
				
				Class elementClass = nil;
				xmlChar *instanceType = xmlGetNsProp(cur, (const xmlChar *) "type", (const xmlChar *) "http://www.w3.org/2001/XMLSchema-instance");
				if(instanceType == NULL) {
					elementClass = [NSString  class];
				} else {
					NSString *elementTypeString = [NSString stringWithCString:(char*)instanceType encoding:NSUTF8StringEncoding];
					
					NSArray *elementTypeArray = [elementTypeString componentsSeparatedByString:@":"];
					
					NSString *elementClassString = nil;
					if([elementTypeArray count] > 1) {
						NSString *prefix = [elementTypeArray objectAtIndex:0];
						NSString *localName = [elementTypeArray objectAtIndex:1];
						
						xmlNsPtr elementNamespace = xmlSearchNs(cur->doc, cur, (const xmlChar *)[prefix UTF8String]);
						
						NSString *standardPrefix = [[USGlobals sharedInstance].wsdlStandardNamespaces objectForKey:[NSString stringWithCString:(char*)elementNamespace->href encoding:NSUTF8StringEncoding]];
						
						elementClassString = [NSString stringWithFormat:@"%@_%@", standardPrefix, localName];
					} else {
						elementClassString = [elementTypeString stringByReplacingOccurrencesOfString:@":" withString:@"_" options:0 range:NSMakeRange(0, [elementTypeString length])];
					}
					
					elementClass = NSClassFromString(elementClassString);
					xmlFree(instanceType);
				}
				
				id newChild = [elementClass deserializeNode:cur];
				
				if(newChild != nil) [self.string addObject:newChild];
			}
		}
	}
}
@end
