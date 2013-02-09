#import <Foundation/Foundation.h>
#import "USAdditions.h"
#import <libxml/tree.h>
#import "USGlobals.h"
@class DataProviderService_GetDataProviderConfig;
@class DataProviderService_GetDataProviderConfigResponse;
@class DataProviderService_GetData;
@class DataProviderService_GetDataResponse;
@class DataProviderService_CancelGetData;
@class DataProviderService_CancelGetDataResponse;
@class DataProviderService_GetExportData;
@class DataProviderService_GetExportDataResponse;
@class DataProviderService_GetTopologyDiagramConfig;
@class DataProviderService_GetTopologyDiagramConfigResponse;
@class DataProviderService_GetTopologyDiagramData;
@class DataProviderService_GetTopologyDiagramDataResponse;
@class DataProviderService_MarkException;
@class DataProviderService_MarkExceptionResponse;
@class DataProviderService_UnmarkException;
@class DataProviderService_UnmarkExceptionResponse;
@class DataProviderService_CreateAnnotation;
@class DataProviderService_CreateAnnotationResponse;
@class DataProviderService_UpdateAnnotation;
@class DataProviderService_UpdateAnnotationResponse;
@class DataProviderService_RemoveAnnotation;
@class DataProviderService_RemoveAnnotationResponse;
#import "tns1.h"
#import "tns3.h"
#import "tns4.h"
@interface DataProviderService_GetDataProviderConfig : NSObject {
	
/* elements */
	tns1_GetConfigDTO * config;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DataProviderService_GetDataProviderConfig *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) tns1_GetConfigDTO * config;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DataProviderService_GetDataProviderConfigResponse : NSObject {
	
/* elements */
	tns1_DataProviderWSResultDTO * GetDataProviderConfigResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DataProviderService_GetDataProviderConfigResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) tns1_DataProviderWSResultDTO * GetDataProviderConfigResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DataProviderService_GetData : NSObject {
	
/* elements */
	NSString * dataProvID;
	tns1_GetDataParamsDTO * parameters;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DataProviderService_GetData *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * dataProvID;
@property (retain) tns1_GetDataParamsDTO * parameters;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DataProviderService_GetDataResponse : NSObject {
	
/* elements */
	tns1_DataProviderWSResultDTO * GetDataResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DataProviderService_GetDataResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) tns1_DataProviderWSResultDTO * GetDataResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DataProviderService_CancelGetData : NSObject {
	
/* elements */
	tns1_GetDataParamsDTO * parameters;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DataProviderService_CancelGetData *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) tns1_GetDataParamsDTO * parameters;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DataProviderService_CancelGetDataResponse : NSObject {
	
/* elements */
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DataProviderService_CancelGetDataResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DataProviderService_GetExportData : NSObject {
	
/* elements */
	NSString * dataProvID;
	tns1_GetDataParamsDTO * parameters;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DataProviderService_GetExportData *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * dataProvID;
@property (retain) tns1_GetDataParamsDTO * parameters;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DataProviderService_GetExportDataResponse : NSObject {
	
/* elements */
	tns1_DataProviderWSResultDTO * GetExportDataResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DataProviderService_GetExportDataResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) tns1_DataProviderWSResultDTO * GetExportDataResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DataProviderService_GetTopologyDiagramConfig : NSObject {
	
/* elements */
	tns1_GetConfigDTO * config;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DataProviderService_GetTopologyDiagramConfig *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) tns1_GetConfigDTO * config;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DataProviderService_GetTopologyDiagramConfigResponse : NSObject {
	
/* elements */
	tns1_DataProviderWSResultDTO * GetTopologyDiagramConfigResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DataProviderService_GetTopologyDiagramConfigResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) tns1_DataProviderWSResultDTO * GetTopologyDiagramConfigResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DataProviderService_GetTopologyDiagramData : NSObject {
	
/* elements */
	NSString * dataProvID;
	tns3_GetTopologyDataParamsDTO * parameters;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DataProviderService_GetTopologyDiagramData *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * dataProvID;
@property (retain) tns3_GetTopologyDataParamsDTO * parameters;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DataProviderService_GetTopologyDiagramDataResponse : NSObject {
	
/* elements */
	tns1_DataProviderWSResultDTO * GetTopologyDiagramDataResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DataProviderService_GetTopologyDiagramDataResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) tns1_DataProviderWSResultDTO * GetTopologyDiagramDataResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DataProviderService_MarkException : NSObject {
	
/* elements */
	tns4_ExceptionParamDTO * exceptionParam;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DataProviderService_MarkException *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) tns4_ExceptionParamDTO * exceptionParam;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DataProviderService_MarkExceptionResponse : NSObject {
	
/* elements */
	tns1_DataProviderWSResultDTO * MarkExceptionResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DataProviderService_MarkExceptionResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) tns1_DataProviderWSResultDTO * MarkExceptionResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DataProviderService_UnmarkException : NSObject {
	
/* elements */
	tns4_ExceptionParamDTO * exceptionParam;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DataProviderService_UnmarkException *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) tns4_ExceptionParamDTO * exceptionParam;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DataProviderService_UnmarkExceptionResponse : NSObject {
	
/* elements */
	tns1_DataProviderWSResultDTO * UnmarkExceptionResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DataProviderService_UnmarkExceptionResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) tns1_DataProviderWSResultDTO * UnmarkExceptionResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DataProviderService_CreateAnnotation : NSObject {
	
/* elements */
	tns4_AnnotationParamDTO * annotationParamDTO;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DataProviderService_CreateAnnotation *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) tns4_AnnotationParamDTO * annotationParamDTO;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DataProviderService_CreateAnnotationResponse : NSObject {
	
/* elements */
	tns1_DataProviderWSResultDTO * CreateAnnotationResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DataProviderService_CreateAnnotationResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) tns1_DataProviderWSResultDTO * CreateAnnotationResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DataProviderService_UpdateAnnotation : NSObject {
	
/* elements */
	tns4_AnnotationParamDTO * annotationParamDTO;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DataProviderService_UpdateAnnotation *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) tns4_AnnotationParamDTO * annotationParamDTO;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DataProviderService_UpdateAnnotationResponse : NSObject {
	
/* elements */
	tns1_DataProviderWSResultDTO * UpdateAnnotationResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DataProviderService_UpdateAnnotationResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) tns1_DataProviderWSResultDTO * UpdateAnnotationResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DataProviderService_RemoveAnnotation : NSObject {
	
/* elements */
	tns4_AnnotationParamDTO * annotationParamDTO;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DataProviderService_RemoveAnnotation *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) tns4_AnnotationParamDTO * annotationParamDTO;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DataProviderService_RemoveAnnotationResponse : NSObject {
	
/* elements */
	tns1_DataProviderWSResultDTO * RemoveAnnotationResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DataProviderService_RemoveAnnotationResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) tns1_DataProviderWSResultDTO * RemoveAnnotationResult;
/* attributes */
- (NSDictionary *)attributes;
@end
/* Cookies handling provided by http://en.wikibooks.org/wiki/Programming:WebObjects/Web_Services/Web_Service_Provider */
#import <libxml/parser.h>
#import "xs.h"
#import "DataProviderService.h"
#import "ns1.h"
#import "tns1.h"
#import "tns2.h"
#import "tns3.h"
#import "tns4.h"
#import "tns5.h"
@class BasicHttpBinding_IDataProviderService;
@interface DataProviderService : NSObject {
	
}
+ (BasicHttpBinding_IDataProviderService *)BasicHttpBinding_IDataProviderService;
@end
@class BasicHttpBinding_IDataProviderServiceResponse;
@class BasicHttpBinding_IDataProviderServiceOperation;
@protocol BasicHttpBinding_IDataProviderServiceResponseDelegate <NSObject>
- (void) operation:(BasicHttpBinding_IDataProviderServiceOperation *)operation completedWithResponse:(BasicHttpBinding_IDataProviderServiceResponse *)response;
@end
@interface BasicHttpBinding_IDataProviderService : NSObject <BasicHttpBinding_IDataProviderServiceResponseDelegate> {
	NSURL *address;
	NSTimeInterval defaultTimeout;
	NSMutableArray *cookies;
	BOOL logXMLInOut;
	BOOL synchronousOperationComplete;
	NSString *authUsername;
	NSString *authPassword;
}
@property (copy) NSURL *address;
@property (assign) BOOL logXMLInOut;
@property (assign) NSTimeInterval defaultTimeout;
@property (nonatomic, retain) NSMutableArray *cookies;
@property (nonatomic, retain) NSString *authUsername;
@property (nonatomic, retain) NSString *authPassword;
- (id)initWithAddress:(NSString *)anAddress;
- (void)sendHTTPCallUsingBody:(NSString *)body soapAction:(NSString *)soapAction forOperation:(BasicHttpBinding_IDataProviderServiceOperation *)operation;
- (void)addCookie:(NSHTTPCookie *)toAdd;
- (BasicHttpBinding_IDataProviderServiceResponse *)GetDataProviderConfigUsingParameters:(DataProviderService_GetDataProviderConfig *)aParameters ;
- (void)GetDataProviderConfigAsyncUsingParameters:(DataProviderService_GetDataProviderConfig *)aParameters  delegate:(id<BasicHttpBinding_IDataProviderServiceResponseDelegate>)responseDelegate;
- (BasicHttpBinding_IDataProviderServiceResponse *)GetDataUsingParameters:(DataProviderService_GetData *)aParameters ;
- (void)GetDataAsyncUsingParameters:(DataProviderService_GetData *)aParameters  delegate:(id<BasicHttpBinding_IDataProviderServiceResponseDelegate>)responseDelegate;
- (BasicHttpBinding_IDataProviderServiceResponse *)CancelGetDataUsingParameters:(DataProviderService_CancelGetData *)aParameters ;
- (void)CancelGetDataAsyncUsingParameters:(DataProviderService_CancelGetData *)aParameters  delegate:(id<BasicHttpBinding_IDataProviderServiceResponseDelegate>)responseDelegate;
- (BasicHttpBinding_IDataProviderServiceResponse *)GetExportDataUsingParameters:(DataProviderService_GetExportData *)aParameters ;
- (void)GetExportDataAsyncUsingParameters:(DataProviderService_GetExportData *)aParameters  delegate:(id<BasicHttpBinding_IDataProviderServiceResponseDelegate>)responseDelegate;
- (BasicHttpBinding_IDataProviderServiceResponse *)GetTopologyDiagramConfigUsingParameters:(DataProviderService_GetTopologyDiagramConfig *)aParameters ;
- (void)GetTopologyDiagramConfigAsyncUsingParameters:(DataProviderService_GetTopologyDiagramConfig *)aParameters  delegate:(id<BasicHttpBinding_IDataProviderServiceResponseDelegate>)responseDelegate;
- (BasicHttpBinding_IDataProviderServiceResponse *)GetTopologyDiagramDataUsingParameters:(DataProviderService_GetTopologyDiagramData *)aParameters ;
- (void)GetTopologyDiagramDataAsyncUsingParameters:(DataProviderService_GetTopologyDiagramData *)aParameters  delegate:(id<BasicHttpBinding_IDataProviderServiceResponseDelegate>)responseDelegate;
- (BasicHttpBinding_IDataProviderServiceResponse *)MarkExceptionUsingParameters:(DataProviderService_MarkException *)aParameters ;
- (void)MarkExceptionAsyncUsingParameters:(DataProviderService_MarkException *)aParameters  delegate:(id<BasicHttpBinding_IDataProviderServiceResponseDelegate>)responseDelegate;
- (BasicHttpBinding_IDataProviderServiceResponse *)UnmarkExceptionUsingParameters:(DataProviderService_UnmarkException *)aParameters ;
- (void)UnmarkExceptionAsyncUsingParameters:(DataProviderService_UnmarkException *)aParameters  delegate:(id<BasicHttpBinding_IDataProviderServiceResponseDelegate>)responseDelegate;
- (BasicHttpBinding_IDataProviderServiceResponse *)CreateAnnotationUsingParameters:(DataProviderService_CreateAnnotation *)aParameters ;
- (void)CreateAnnotationAsyncUsingParameters:(DataProviderService_CreateAnnotation *)aParameters  delegate:(id<BasicHttpBinding_IDataProviderServiceResponseDelegate>)responseDelegate;
- (BasicHttpBinding_IDataProviderServiceResponse *)UpdateAnnotationUsingParameters:(DataProviderService_UpdateAnnotation *)aParameters ;
- (void)UpdateAnnotationAsyncUsingParameters:(DataProviderService_UpdateAnnotation *)aParameters  delegate:(id<BasicHttpBinding_IDataProviderServiceResponseDelegate>)responseDelegate;
- (BasicHttpBinding_IDataProviderServiceResponse *)RemoveAnnotationUsingParameters:(DataProviderService_RemoveAnnotation *)aParameters ;
- (void)RemoveAnnotationAsyncUsingParameters:(DataProviderService_RemoveAnnotation *)aParameters  delegate:(id<BasicHttpBinding_IDataProviderServiceResponseDelegate>)responseDelegate;
@end
@interface BasicHttpBinding_IDataProviderServiceOperation : NSOperation {
	BasicHttpBinding_IDataProviderService *binding;
	BasicHttpBinding_IDataProviderServiceResponse *response;
	id<BasicHttpBinding_IDataProviderServiceResponseDelegate> delegate;
	NSMutableData *responseData;
	NSURLConnection *urlConnection;
}
@property (retain) BasicHttpBinding_IDataProviderService *binding;
@property (readonly) BasicHttpBinding_IDataProviderServiceResponse *response;
@property (nonatomic, assign) id<BasicHttpBinding_IDataProviderServiceResponseDelegate> delegate;
@property (nonatomic, retain) NSMutableData *responseData;
@property (nonatomic, retain) NSURLConnection *urlConnection;
- (id)initWithBinding:(BasicHttpBinding_IDataProviderService *)aBinding delegate:(id<BasicHttpBinding_IDataProviderServiceResponseDelegate>)aDelegate;
@end
@interface BasicHttpBinding_IDataProviderService_GetDataProviderConfig : BasicHttpBinding_IDataProviderServiceOperation {
	DataProviderService_GetDataProviderConfig * parameters;
}
@property (retain) DataProviderService_GetDataProviderConfig * parameters;
- (id)initWithBinding:(BasicHttpBinding_IDataProviderService *)aBinding delegate:(id<BasicHttpBinding_IDataProviderServiceResponseDelegate>)aDelegate
	parameters:(DataProviderService_GetDataProviderConfig *)aParameters
;
@end
@interface BasicHttpBinding_IDataProviderService_GetData : BasicHttpBinding_IDataProviderServiceOperation {
	DataProviderService_GetData * parameters;
}
@property (retain) DataProviderService_GetData * parameters;
- (id)initWithBinding:(BasicHttpBinding_IDataProviderService *)aBinding delegate:(id<BasicHttpBinding_IDataProviderServiceResponseDelegate>)aDelegate
	parameters:(DataProviderService_GetData *)aParameters
;
@end
@interface BasicHttpBinding_IDataProviderService_CancelGetData : BasicHttpBinding_IDataProviderServiceOperation {
	DataProviderService_CancelGetData * parameters;
}
@property (retain) DataProviderService_CancelGetData * parameters;
- (id)initWithBinding:(BasicHttpBinding_IDataProviderService *)aBinding delegate:(id<BasicHttpBinding_IDataProviderServiceResponseDelegate>)aDelegate
	parameters:(DataProviderService_CancelGetData *)aParameters
;
@end
@interface BasicHttpBinding_IDataProviderService_GetExportData : BasicHttpBinding_IDataProviderServiceOperation {
	DataProviderService_GetExportData * parameters;
}
@property (retain) DataProviderService_GetExportData * parameters;
- (id)initWithBinding:(BasicHttpBinding_IDataProviderService *)aBinding delegate:(id<BasicHttpBinding_IDataProviderServiceResponseDelegate>)aDelegate
	parameters:(DataProviderService_GetExportData *)aParameters
;
@end
@interface BasicHttpBinding_IDataProviderService_GetTopologyDiagramConfig : BasicHttpBinding_IDataProviderServiceOperation {
	DataProviderService_GetTopologyDiagramConfig * parameters;
}
@property (retain) DataProviderService_GetTopologyDiagramConfig * parameters;
- (id)initWithBinding:(BasicHttpBinding_IDataProviderService *)aBinding delegate:(id<BasicHttpBinding_IDataProviderServiceResponseDelegate>)aDelegate
	parameters:(DataProviderService_GetTopologyDiagramConfig *)aParameters
;
@end
@interface BasicHttpBinding_IDataProviderService_GetTopologyDiagramData : BasicHttpBinding_IDataProviderServiceOperation {
	DataProviderService_GetTopologyDiagramData * parameters;
}
@property (retain) DataProviderService_GetTopologyDiagramData * parameters;
- (id)initWithBinding:(BasicHttpBinding_IDataProviderService *)aBinding delegate:(id<BasicHttpBinding_IDataProviderServiceResponseDelegate>)aDelegate
	parameters:(DataProviderService_GetTopologyDiagramData *)aParameters
;
@end
@interface BasicHttpBinding_IDataProviderService_MarkException : BasicHttpBinding_IDataProviderServiceOperation {
	DataProviderService_MarkException * parameters;
}
@property (retain) DataProviderService_MarkException * parameters;
- (id)initWithBinding:(BasicHttpBinding_IDataProviderService *)aBinding delegate:(id<BasicHttpBinding_IDataProviderServiceResponseDelegate>)aDelegate
	parameters:(DataProviderService_MarkException *)aParameters
;
@end
@interface BasicHttpBinding_IDataProviderService_UnmarkException : BasicHttpBinding_IDataProviderServiceOperation {
	DataProviderService_UnmarkException * parameters;
}
@property (retain) DataProviderService_UnmarkException * parameters;
- (id)initWithBinding:(BasicHttpBinding_IDataProviderService *)aBinding delegate:(id<BasicHttpBinding_IDataProviderServiceResponseDelegate>)aDelegate
	parameters:(DataProviderService_UnmarkException *)aParameters
;
@end
@interface BasicHttpBinding_IDataProviderService_CreateAnnotation : BasicHttpBinding_IDataProviderServiceOperation {
	DataProviderService_CreateAnnotation * parameters;
}
@property (retain) DataProviderService_CreateAnnotation * parameters;
- (id)initWithBinding:(BasicHttpBinding_IDataProviderService *)aBinding delegate:(id<BasicHttpBinding_IDataProviderServiceResponseDelegate>)aDelegate
	parameters:(DataProviderService_CreateAnnotation *)aParameters
;
@end
@interface BasicHttpBinding_IDataProviderService_UpdateAnnotation : BasicHttpBinding_IDataProviderServiceOperation {
	DataProviderService_UpdateAnnotation * parameters;
}
@property (retain) DataProviderService_UpdateAnnotation * parameters;
- (id)initWithBinding:(BasicHttpBinding_IDataProviderService *)aBinding delegate:(id<BasicHttpBinding_IDataProviderServiceResponseDelegate>)aDelegate
	parameters:(DataProviderService_UpdateAnnotation *)aParameters
;
@end
@interface BasicHttpBinding_IDataProviderService_RemoveAnnotation : BasicHttpBinding_IDataProviderServiceOperation {
	DataProviderService_RemoveAnnotation * parameters;
}
@property (retain) DataProviderService_RemoveAnnotation * parameters;
- (id)initWithBinding:(BasicHttpBinding_IDataProviderService *)aBinding delegate:(id<BasicHttpBinding_IDataProviderServiceResponseDelegate>)aDelegate
	parameters:(DataProviderService_RemoveAnnotation *)aParameters
;
@end
@interface BasicHttpBinding_IDataProviderService_envelope : NSObject {
}
+ (BasicHttpBinding_IDataProviderService_envelope *)sharedInstance;
- (NSString *)serializedFormUsingHeaderElements:(NSDictionary *)headerElements bodyElements:(NSDictionary *)bodyElements;
@end
@interface BasicHttpBinding_IDataProviderServiceResponse : NSObject {
	NSArray *headers;
	NSArray *bodyParts;
	NSError *error;
}
@property (retain) NSArray *headers;
@property (retain) NSArray *bodyParts;
@property (retain) NSError *error;
@end
