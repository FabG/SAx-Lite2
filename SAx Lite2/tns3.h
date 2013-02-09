#import <Foundation/Foundation.h>
#import "USAdditions.h"
#import <libxml/tree.h>
#import "USGlobals.h"
@class tns3_GetTopologyDataParamsDTO;
#import "tns2.h"
#import "tns1.h"
@interface tns3_GetTopologyDataParamsDTO : NSObject {
	
/* elements */
	tns2_ArrayOfstring * ContextInfo;
	USBoolean * ForceDataRefresh;
	tns1_ArrayOfFilterDTO * PreExecFilter;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (tns3_GetTopologyDataParamsDTO *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) tns2_ArrayOfstring * ContextInfo;
@property (retain) USBoolean * ForceDataRefresh;
@property (retain) tns1_ArrayOfFilterDTO * PreExecFilter;
/* attributes */
- (NSDictionary *)attributes;
@end
