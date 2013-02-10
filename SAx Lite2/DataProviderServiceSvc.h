#import <Foundation/Foundation.h>
#import "USAdditions.h"
#import <libxml/tree.h>
#import "USGlobals.h"
@class DataProviderServiceSvc_GetDataProviderConfig;
@class DataProviderServiceSvc_GetDataProviderConfigResponse;
@class DataProviderServiceSvc_GetData;
@class DataProviderServiceSvc_GetDataResponse;
@class DataProviderServiceSvc_CancelGetData;
@class DataProviderServiceSvc_CancelGetDataResponse;
@class DataProviderServiceSvc_GetExportData;
@class DataProviderServiceSvc_GetExportDataResponse;
@class DataProviderServiceSvc_GetTopologyDiagramConfig;
@class DataProviderServiceSvc_GetTopologyDiagramConfigResponse;
@class DataProviderServiceSvc_GetTopologyDiagramData;
@class DataProviderServiceSvc_GetTopologyDiagramDataResponse;
@class DataProviderServiceSvc_MarkException;
@class DataProviderServiceSvc_MarkExceptionResponse;
@class DataProviderServiceSvc_UnmarkException;
@class DataProviderServiceSvc_UnmarkExceptionResponse;
@class DataProviderServiceSvc_CreateAnnotation;
@class DataProviderServiceSvc_CreateAnnotationResponse;
@class DataProviderServiceSvc_UpdateAnnotation;
@class DataProviderServiceSvc_UpdateAnnotationResponse;
@class DataProviderServiceSvc_RemoveAnnotation;
@class DataProviderServiceSvc_RemoveAnnotationResponse;
#import "tns1.h"
#import "tns3.h"
#import "tns4.h"
@interface DataProviderServiceSvc_GetDataProviderConfig : NSObject {
	
/* elements */
	tns1_GetConfigDTO * config;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DataProviderServiceSvc_GetDataProviderConfig *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) tns1_GetConfigDTO * config;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DataProviderServiceSvc_GetDataProviderConfigResponse : NSObject {
	
/* elements */
	tns1_DataProviderWSResultDTO * GetDataProviderConfigResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DataProviderServiceSvc_GetDataProviderConfigResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) tns1_DataProviderWSResultDTO * GetDataProviderConfigResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DataProviderServiceSvc_GetData : NSObject {
	
/* elements */
	NSString * dataProvID;
	tns1_GetDataParamsDTO * parameters;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DataProviderServiceSvc_GetData *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * dataProvID;
@property (retain) tns1_GetDataParamsDTO * parameters;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DataProviderServiceSvc_GetDataResponse : NSObject {
	
/* elements */
	tns1_DataProviderWSResultDTO * GetDataResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DataProviderServiceSvc_GetDataResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) tns1_DataProviderWSResultDTO * GetDataResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DataProviderServiceSvc_CancelGetData : NSObject {
	
/* elements */
	tns1_GetDataParamsDTO * parameters;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DataProviderServiceSvc_CancelGetData *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) tns1_GetDataParamsDTO * parameters;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DataProviderServiceSvc_CancelGetDataResponse : NSObject {
	
/* elements */
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DataProviderServiceSvc_CancelGetDataResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DataProviderServiceSvc_GetExportData : NSObject {
	
/* elements */
	NSString * dataProvID;
	tns1_GetDataParamsDTO * parameters;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DataProviderServiceSvc_GetExportData *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * dataProvID;
@property (retain) tns1_GetDataParamsDTO * parameters;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DataProviderServiceSvc_GetExportDataResponse : NSObject {
	
/* elements */
	tns1_DataProviderWSResultDTO * GetExportDataResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DataProviderServiceSvc_GetExportDataResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) tns1_DataProviderWSResultDTO * GetExportDataResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DataProviderServiceSvc_GetTopologyDiagramConfig : NSObject {
	
/* elements */
	tns1_GetConfigDTO * config;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DataProviderServiceSvc_GetTopologyDiagramConfig *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) tns1_GetConfigDTO * config;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DataProviderServiceSvc_GetTopologyDiagramConfigResponse : NSObject {
	
/* elements */
	tns1_DataProviderWSResultDTO * GetTopologyDiagramConfigResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DataProviderServiceSvc_GetTopologyDiagramConfigResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) tns1_DataProviderWSResultDTO * GetTopologyDiagramConfigResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DataProviderServiceSvc_GetTopologyDiagramData : NSObject {
	
/* elements */
	NSString * dataProvID;
	tns3_GetTopologyDataParamsDTO * parameters;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DataProviderServiceSvc_GetTopologyDiagramData *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * dataProvID;
@property (retain) tns3_GetTopologyDataParamsDTO * parameters;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DataProviderServiceSvc_GetTopologyDiagramDataResponse : NSObject {
	
/* elements */
	tns1_DataProviderWSResultDTO * GetTopologyDiagramDataResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DataProviderServiceSvc_GetTopologyDiagramDataResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) tns1_DataProviderWSResultDTO * GetTopologyDiagramDataResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DataProviderServiceSvc_MarkException : NSObject {
	
/* elements */
	tns4_ExceptionParamDTO * exceptionParam;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DataProviderServiceSvc_MarkException *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) tns4_ExceptionParamDTO * exceptionParam;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DataProviderServiceSvc_MarkExceptionResponse : NSObject {
	
/* elements */
	tns1_DataProviderWSResultDTO * MarkExceptionResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DataProviderServiceSvc_MarkExceptionResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) tns1_DataProviderWSResultDTO * MarkExceptionResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DataProviderServiceSvc_UnmarkException : NSObject {
	
/* elements */
	tns4_ExceptionParamDTO * exceptionParam;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DataProviderServiceSvc_UnmarkException *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) tns4_ExceptionParamDTO * exceptionParam;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DataProviderServiceSvc_UnmarkExceptionResponse : NSObject {
	
/* elements */
	tns1_DataProviderWSResultDTO * UnmarkExceptionResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DataProviderServiceSvc_UnmarkExceptionResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) tns1_DataProviderWSResultDTO * UnmarkExceptionResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DataProviderServiceSvc_CreateAnnotation : NSObject {
	
/* elements */
	tns4_AnnotationParamDTO * annotationParamDTO;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DataProviderServiceSvc_CreateAnnotation *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) tns4_AnnotationParamDTO * annotationParamDTO;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DataProviderServiceSvc_CreateAnnotationResponse : NSObject {
	
/* elements */
	tns1_DataProviderWSResultDTO * CreateAnnotationResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DataProviderServiceSvc_CreateAnnotationResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) tns1_DataProviderWSResultDTO * CreateAnnotationResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DataProviderServiceSvc_UpdateAnnotation : NSObject {
	
/* elements */
	tns4_AnnotationParamDTO * annotationParamDTO;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DataProviderServiceSvc_UpdateAnnotation *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) tns4_AnnotationParamDTO * annotationParamDTO;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DataProviderServiceSvc_UpdateAnnotationResponse : NSObject {
	
/* elements */
	tns1_DataProviderWSResultDTO * UpdateAnnotationResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DataProviderServiceSvc_UpdateAnnotationResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) tns1_DataProviderWSResultDTO * UpdateAnnotationResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DataProviderServiceSvc_RemoveAnnotation : NSObject {
	
/* elements */
	tns4_AnnotationParamDTO * annotationParamDTO;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DataProviderServiceSvc_RemoveAnnotation *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) tns4_AnnotationParamDTO * annotationParamDTO;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DataProviderServiceSvc_RemoveAnnotationResponse : NSObject {
	
/* elements */
	tns1_DataProviderWSResultDTO * RemoveAnnotationResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DataProviderServiceSvc_RemoveAnnotationResponse *)deserializeNode:(xmlNodePtr)cur;
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
#import "DataProviderServiceSvc.h"
#import "ns1.h"
#import "tns1.h"
#import "tns2.h"
#import "tns3.h"
#import "tns4.h"
#import "tns5.h"
@class BasicHttpBinding_IDataProviderServiceBinding;
@interface DataProviderServiceSvc : NSObject {
	
}
+ (BasicHttpBinding_IDataProviderServiceBinding *)BasicHttpBinding_IDataProviderServiceBinding;
@end
@class BasicHttpBinding_IDataProviderServiceBindingResponse;
@class BasicHttpBinding_IDataProviderServiceBindingOperation;
@protocol BasicHttpBinding_IDataProviderServiceBindingResponseDelegate <NSObject>
- (void) operation:(BasicHttpBinding_IDataProviderServiceBindingOperation *)operation completedWithResponse:(BasicHttpBinding_IDataProviderServiceBindingResponse *)response;
@end
@interface BasicHttpBinding_IDataProviderServiceBinding : NSObject <BasicHttpBinding_IDataProviderServiceBindingResponseDelegate> {
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
- (void)sendHTTPCallUsingBody:(NSString *)body soapAction:(NSString *)soapAction forOperation:(BasicHttpBinding_IDataProviderServiceBindingOperation *)operation;
- (void)addCookie:(NSHTTPCookie *)toAdd;
- (BasicHttpBinding_IDataProviderServiceBindingResponse *)GetDataProviderConfigUsingParameters:(DataProviderServiceSvc_GetDataProviderConfig *)aParameters ;
- (void)GetDataProviderConfigAsyncUsingParameters:(DataProviderServiceSvc_GetDataProviderConfig *)aParameters  delegate:(id<BasicHttpBinding_IDataProviderServiceBindingResponseDelegate>)responseDelegate;
- (BasicHttpBinding_IDataProviderServiceBindingResponse *)GetDataUsingParameters:(DataProviderServiceSvc_GetData *)aParameters ;
- (void)GetDataAsyncUsingParameters:(DataProviderServiceSvc_GetData *)aParameters  delegate:(id<BasicHttpBinding_IDataProviderServiceBindingResponseDelegate>)responseDelegate;
- (BasicHttpBinding_IDataProviderServiceBindingResponse *)CancelGetDataUsingParameters:(DataProviderServiceSvc_CancelGetData *)aParameters ;
- (void)CancelGetDataAsyncUsingParameters:(DataProviderServiceSvc_CancelGetData *)aParameters  delegate:(id<BasicHttpBinding_IDataProviderServiceBindingResponseDelegate>)responseDelegate;
- (BasicHttpBinding_IDataProviderServiceBindingResponse *)GetExportDataUsingParameters:(DataProviderServiceSvc_GetExportData *)aParameters ;
- (void)GetExportDataAsyncUsingParameters:(DataProviderServiceSvc_GetExportData *)aParameters  delegate:(id<BasicHttpBinding_IDataProviderServiceBindingResponseDelegate>)responseDelegate;
- (BasicHttpBinding_IDataProviderServiceBindingResponse *)GetTopologyDiagramConfigUsingParameters:(DataProviderServiceSvc_GetTopologyDiagramConfig *)aParameters ;
- (void)GetTopologyDiagramConfigAsyncUsingParameters:(DataProviderServiceSvc_GetTopologyDiagramConfig *)aParameters  delegate:(id<BasicHttpBinding_IDataProviderServiceBindingResponseDelegate>)responseDelegate;
- (BasicHttpBinding_IDataProviderServiceBindingResponse *)GetTopologyDiagramDataUsingParameters:(DataProviderServiceSvc_GetTopologyDiagramData *)aParameters ;
- (void)GetTopologyDiagramDataAsyncUsingParameters:(DataProviderServiceSvc_GetTopologyDiagramData *)aParameters  delegate:(id<BasicHttpBinding_IDataProviderServiceBindingResponseDelegate>)responseDelegate;
- (BasicHttpBinding_IDataProviderServiceBindingResponse *)MarkExceptionUsingParameters:(DataProviderServiceSvc_MarkException *)aParameters ;
- (void)MarkExceptionAsyncUsingParameters:(DataProviderServiceSvc_MarkException *)aParameters  delegate:(id<BasicHttpBinding_IDataProviderServiceBindingResponseDelegate>)responseDelegate;
- (BasicHttpBinding_IDataProviderServiceBindingResponse *)UnmarkExceptionUsingParameters:(DataProviderServiceSvc_UnmarkException *)aParameters ;
- (void)UnmarkExceptionAsyncUsingParameters:(DataProviderServiceSvc_UnmarkException *)aParameters  delegate:(id<BasicHttpBinding_IDataProviderServiceBindingResponseDelegate>)responseDelegate;
- (BasicHttpBinding_IDataProviderServiceBindingResponse *)CreateAnnotationUsingParameters:(DataProviderServiceSvc_CreateAnnotation *)aParameters ;
- (void)CreateAnnotationAsyncUsingParameters:(DataProviderServiceSvc_CreateAnnotation *)aParameters  delegate:(id<BasicHttpBinding_IDataProviderServiceBindingResponseDelegate>)responseDelegate;
- (BasicHttpBinding_IDataProviderServiceBindingResponse *)UpdateAnnotationUsingParameters:(DataProviderServiceSvc_UpdateAnnotation *)aParameters ;
- (void)UpdateAnnotationAsyncUsingParameters:(DataProviderServiceSvc_UpdateAnnotation *)aParameters  delegate:(id<BasicHttpBinding_IDataProviderServiceBindingResponseDelegate>)responseDelegate;
- (BasicHttpBinding_IDataProviderServiceBindingResponse *)RemoveAnnotationUsingParameters:(DataProviderServiceSvc_RemoveAnnotation *)aParameters ;
- (void)RemoveAnnotationAsyncUsingParameters:(DataProviderServiceSvc_RemoveAnnotation *)aParameters  delegate:(id<BasicHttpBinding_IDataProviderServiceBindingResponseDelegate>)responseDelegate;
@end
@interface BasicHttpBinding_IDataProviderServiceBindingOperation : NSOperation {
	BasicHttpBinding_IDataProviderServiceBinding *binding;
	BasicHttpBinding_IDataProviderServiceBindingResponse *response;
	id<BasicHttpBinding_IDataProviderServiceBindingResponseDelegate> delegate;
	NSMutableData *responseData;
	NSURLConnection *urlConnection;
}
@property (retain) BasicHttpBinding_IDataProviderServiceBinding *binding;
@property (readonly) BasicHttpBinding_IDataProviderServiceBindingResponse *response;
@property (nonatomic, assign) id<BasicHttpBinding_IDataProviderServiceBindingResponseDelegate> delegate;
@property (nonatomic, retain) NSMutableData *responseData;
@property (nonatomic, retain) NSURLConnection *urlConnection;
- (id)initWithBinding:(BasicHttpBinding_IDataProviderServiceBinding *)aBinding delegate:(id<BasicHttpBinding_IDataProviderServiceBindingResponseDelegate>)aDelegate;
@end
@interface BasicHttpBinding_IDataProviderServiceBinding_GetDataProviderConfig : BasicHttpBinding_IDataProviderServiceBindingOperation {
	DataProviderServiceSvc_GetDataProviderConfig * parameters;
}
@property (retain) DataProviderServiceSvc_GetDataProviderConfig * parameters;
- (id)initWithBinding:(BasicHttpBinding_IDataProviderServiceBinding *)aBinding delegate:(id<BasicHttpBinding_IDataProviderServiceBindingResponseDelegate>)aDelegate
	parameters:(DataProviderServiceSvc_GetDataProviderConfig *)aParameters
;
@end
@interface BasicHttpBinding_IDataProviderServiceBinding_GetData : BasicHttpBinding_IDataProviderServiceBindingOperation {
	DataProviderServiceSvc_GetData * parameters;
}
@property (retain) DataProviderServiceSvc_GetData * parameters;
- (id)initWithBinding:(BasicHttpBinding_IDataProviderServiceBinding *)aBinding delegate:(id<BasicHttpBinding_IDataProviderServiceBindingResponseDelegate>)aDelegate
	parameters:(DataProviderServiceSvc_GetData *)aParameters
;
@end
@interface BasicHttpBinding_IDataProviderServiceBinding_CancelGetData : BasicHttpBinding_IDataProviderServiceBindingOperation {
	DataProviderServiceSvc_CancelGetData * parameters;
}
@property (retain) DataProviderServiceSvc_CancelGetData * parameters;
- (id)initWithBinding:(BasicHttpBinding_IDataProviderServiceBinding *)aBinding delegate:(id<BasicHttpBinding_IDataProviderServiceBindingResponseDelegate>)aDelegate
	parameters:(DataProviderServiceSvc_CancelGetData *)aParameters
;
@end
@interface BasicHttpBinding_IDataProviderServiceBinding_GetExportData : BasicHttpBinding_IDataProviderServiceBindingOperation {
	DataProviderServiceSvc_GetExportData * parameters;
}
@property (retain) DataProviderServiceSvc_GetExportData * parameters;
- (id)initWithBinding:(BasicHttpBinding_IDataProviderServiceBinding *)aBinding delegate:(id<BasicHttpBinding_IDataProviderServiceBindingResponseDelegate>)aDelegate
	parameters:(DataProviderServiceSvc_GetExportData *)aParameters
;
@end
@interface BasicHttpBinding_IDataProviderServiceBinding_GetTopologyDiagramConfig : BasicHttpBinding_IDataProviderServiceBindingOperation {
	DataProviderServiceSvc_GetTopologyDiagramConfig * parameters;
}
@property (retain) DataProviderServiceSvc_GetTopologyDiagramConfig * parameters;
- (id)initWithBinding:(BasicHttpBinding_IDataProviderServiceBinding *)aBinding delegate:(id<BasicHttpBinding_IDataProviderServiceBindingResponseDelegate>)aDelegate
	parameters:(DataProviderServiceSvc_GetTopologyDiagramConfig *)aParameters
;
@end
@interface BasicHttpBinding_IDataProviderServiceBinding_GetTopologyDiagramData : BasicHttpBinding_IDataProviderServiceBindingOperation {
	DataProviderServiceSvc_GetTopologyDiagramData * parameters;
}
@property (retain) DataProviderServiceSvc_GetTopologyDiagramData * parameters;
- (id)initWithBinding:(BasicHttpBinding_IDataProviderServiceBinding *)aBinding delegate:(id<BasicHttpBinding_IDataProviderServiceBindingResponseDelegate>)aDelegate
	parameters:(DataProviderServiceSvc_GetTopologyDiagramData *)aParameters
;
@end
@interface BasicHttpBinding_IDataProviderServiceBinding_MarkException : BasicHttpBinding_IDataProviderServiceBindingOperation {
	DataProviderServiceSvc_MarkException * parameters;
}
@property (retain) DataProviderServiceSvc_MarkException * parameters;
- (id)initWithBinding:(BasicHttpBinding_IDataProviderServiceBinding *)aBinding delegate:(id<BasicHttpBinding_IDataProviderServiceBindingResponseDelegate>)aDelegate
	parameters:(DataProviderServiceSvc_MarkException *)aParameters
;
@end
@interface BasicHttpBinding_IDataProviderServiceBinding_UnmarkException : BasicHttpBinding_IDataProviderServiceBindingOperation {
	DataProviderServiceSvc_UnmarkException * parameters;
}
@property (retain) DataProviderServiceSvc_UnmarkException * parameters;
- (id)initWithBinding:(BasicHttpBinding_IDataProviderServiceBinding *)aBinding delegate:(id<BasicHttpBinding_IDataProviderServiceBindingResponseDelegate>)aDelegate
	parameters:(DataProviderServiceSvc_UnmarkException *)aParameters
;
@end
@interface BasicHttpBinding_IDataProviderServiceBinding_CreateAnnotation : BasicHttpBinding_IDataProviderServiceBindingOperation {
	DataProviderServiceSvc_CreateAnnotation * parameters;
}
@property (retain) DataProviderServiceSvc_CreateAnnotation * parameters;
- (id)initWithBinding:(BasicHttpBinding_IDataProviderServiceBinding *)aBinding delegate:(id<BasicHttpBinding_IDataProviderServiceBindingResponseDelegate>)aDelegate
	parameters:(DataProviderServiceSvc_CreateAnnotation *)aParameters
;
@end
@interface BasicHttpBinding_IDataProviderServiceBinding_UpdateAnnotation : BasicHttpBinding_IDataProviderServiceBindingOperation {
	DataProviderServiceSvc_UpdateAnnotation * parameters;
}
@property (retain) DataProviderServiceSvc_UpdateAnnotation * parameters;
- (id)initWithBinding:(BasicHttpBinding_IDataProviderServiceBinding *)aBinding delegate:(id<BasicHttpBinding_IDataProviderServiceBindingResponseDelegate>)aDelegate
	parameters:(DataProviderServiceSvc_UpdateAnnotation *)aParameters
;
@end
@interface BasicHttpBinding_IDataProviderServiceBinding_RemoveAnnotation : BasicHttpBinding_IDataProviderServiceBindingOperation {
	DataProviderServiceSvc_RemoveAnnotation * parameters;
}
@property (retain) DataProviderServiceSvc_RemoveAnnotation * parameters;
- (id)initWithBinding:(BasicHttpBinding_IDataProviderServiceBinding *)aBinding delegate:(id<BasicHttpBinding_IDataProviderServiceBindingResponseDelegate>)aDelegate
	parameters:(DataProviderServiceSvc_RemoveAnnotation *)aParameters
;
@end
@interface BasicHttpBinding_IDataProviderServiceBinding_envelope : NSObject {
}
+ (BasicHttpBinding_IDataProviderServiceBinding_envelope *)sharedInstance;
- (NSString *)serializedFormUsingHeaderElements:(NSDictionary *)headerElements bodyElements:(NSDictionary *)bodyElements;
@end
@interface BasicHttpBinding_IDataProviderServiceBindingResponse : NSObject {
	NSArray *headers;
	NSArray *bodyParts;
	NSError *error;
}
@property (retain) NSArray *headers;
@property (retain) NSArray *bodyParts;
@property (retain) NSError *error;
@end
