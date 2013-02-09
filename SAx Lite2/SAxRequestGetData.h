//
//  SAxRequestGetData.h
//  SAx Lite2
//
//  Created by Fabrice Guillaume on 2/8/13.
//  Copyright (c) 2013 Fabrice Guillaume. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataProviderService.h"

@interface SAxRequestGetData : NSObject
{
    NSURLConnection *connection;
    NSMutableData *xmlData;
}
-(void)fecthData;

@end
