#import <Foundation/Foundation.h>
#import "USAdditions.h"
#import <libxml/tree.h>
#import "USGlobals.h"
@class tns4_ExceptionParamDTO;
@class tns4_AnnotationParamDTO;
#import "tns2.h"
@interface tns4_ExceptionParamDTO : NSObject {
	
/* elements */
	NSString * DataProviderId;
	tns2_ArrayOfstring * RowIds;
	NSString * UserId;
	NSString * Visibility;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (tns4_ExceptionParamDTO *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * DataProviderId;
@property (retain) tns2_ArrayOfstring * RowIds;
@property (retain) NSString * UserId;
@property (retain) NSString * Visibility;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface tns4_AnnotationParamDTO : NSObject {
	
/* elements */
	NSString * ColId;
	NSString * DataProviderId;
	NSString * Description;
	NSString * OwnerUserId;
	NSString * RowId;
	NSString * Type;
	NSString * UpdateUserId;
	NSString * Visibility;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (tns4_AnnotationParamDTO *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * ColId;
@property (retain) NSString * DataProviderId;
@property (retain) NSString * Description;
@property (retain) NSString * OwnerUserId;
@property (retain) NSString * RowId;
@property (retain) NSString * Type;
@property (retain) NSString * UpdateUserId;
@property (retain) NSString * Visibility;
/* attributes */
- (NSDictionary *)attributes;
@end
