//
//  SAxSOAPProxyGetData.h
//  SAx Lite2
//
//  Created by Fabrice Guillaume on 2/9/13.
//  Copyright (c) 2013 Fabrice Guillaume. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataProviderServiceSvc.h"

@interface SAxSOAPProxyGetData : NSObject

-(void)processRequestGetData;
-(void)processResponseGetData :(BasicHttpBinding_IDataProviderServiceBindingResponse *)soapResponse;

@end
