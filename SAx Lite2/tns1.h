#import <Foundation/Foundation.h>
#import "USAdditions.h"
#import <libxml/tree.h>
#import "USGlobals.h"
@class tns1_GetConfigDTO;
@class tns1_DataProviderWSResultDTO;
@class tns1_GetDataParamsDTO;
@class tns1_PagingDTO;
@class tns1_ArrayOfFilterDTO;
@class tns1_ArrayOfSortDTO;
@class tns1_FilterDTO;
@class tns1_SortDTO;
#import "tns2.h"
@interface tns1_GetConfigDTO : NSObject {
	
/* elements */
	tns2_ArrayOfstring * ContextInfo;
	NSString * DataProviderId;
	USBoolean * ForceConfigRefresh;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (tns1_GetConfigDTO *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) tns2_ArrayOfstring * ContextInfo;
@property (retain) NSString * DataProviderId;
@property (retain) USBoolean * ForceConfigRefresh;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface tns1_DataProviderWSResultDTO : NSObject {
	
/* elements */
	NSString * Code;
	NSString * Description;
	NSString * ResultObject;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (tns1_DataProviderWSResultDTO *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * Code;
@property (retain) NSString * Description;
@property (retain) NSString * ResultObject;
/* attributes */
- (NSDictionary *)attributes;
@end
typedef enum {
	tns1_ExceptionMode_none = 0,
	tns1_ExceptionMode_None,
	tns1_ExceptionMode_OnlyException,
	tns1_ExceptionMode_ExcludeException,
	tns1_ExceptionMode_MixedMode,
} tns1_ExceptionMode;
tns1_ExceptionMode tns1_ExceptionMode_enumFromString(NSString *string);
NSString * tns1_ExceptionMode_stringFromEnum(tns1_ExceptionMode enumValue);
@interface tns1_PagingDTO : NSObject {
	
/* elements */
	NSNumber * PageSize;
	NSNumber * RequiredPage;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (tns1_PagingDTO *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSNumber * PageSize;
@property (retain) NSNumber * RequiredPage;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface tns1_FilterDTO : NSObject {
	
/* elements */
	NSString * ComparisonOperator;
	NSString * Name;
	NSString * Value;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (tns1_FilterDTO *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * ComparisonOperator;
@property (retain) NSString * Name;
@property (retain) NSString * Value;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface tns1_ArrayOfFilterDTO : NSObject {
	
/* elements */
	NSMutableArray *FilterDTO;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (tns1_ArrayOfFilterDTO *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
- (void)addFilterDTO:(tns1_FilterDTO *)toAdd;
@property (readonly) NSMutableArray * FilterDTO;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface tns1_SortDTO : NSObject {
	
/* elements */
	NSString * ColumnId;
	NSString * Direction;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (tns1_SortDTO *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * ColumnId;
@property (retain) NSString * Direction;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface tns1_ArrayOfSortDTO : NSObject {
	
/* elements */
	NSMutableArray *SortDTO;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (tns1_ArrayOfSortDTO *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
- (void)addSortDTO:(tns1_SortDTO *)toAdd;
@property (readonly) NSMutableArray * SortDTO;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface tns1_GetDataParamsDTO : NSObject {
	
/* elements */
	tns2_ArrayOfstring * ContextInfo;
	tns1_ExceptionMode ExceptionMode;
	USBoolean * ForceDataRefresh;
	tns1_PagingDTO * PageInfo;
	tns1_ArrayOfFilterDTO * PostExecFilter;
	tns1_ArrayOfFilterDTO * PreExecFilter;
	NSString * RequestId;
	tns1_ArrayOfSortDTO * SortInfo;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (tns1_GetDataParamsDTO *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) tns2_ArrayOfstring * ContextInfo;
@property (assign) tns1_ExceptionMode ExceptionMode;
@property (retain) USBoolean * ForceDataRefresh;
@property (retain) tns1_PagingDTO * PageInfo;
@property (retain) tns1_ArrayOfFilterDTO * PostExecFilter;
@property (retain) tns1_ArrayOfFilterDTO * PreExecFilter;
@property (retain) NSString * RequestId;
@property (retain) tns1_ArrayOfSortDTO * SortInfo;
/* attributes */
- (NSDictionary *)attributes;
@end
