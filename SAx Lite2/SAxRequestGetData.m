//
//  SAxRequestGetData.m
//  SAx Lite2
//
//  Created by Fabrice Guillaume on 2/8/13.
//  Copyright (c) 2013 Fabrice Guillaume. All rights reserved.
//

#import "SAxRequestGetData.h"

@implementation SAxRequestGetData

// Note for self: DON'T USE THIS CLASS for our little app (unless we move to another service)
// This won't work for our SAx Lite app as the SOAP Webservice will require a client
// to be generated to consume the data (see the "wsdl2objc" google tool)

// Class to handle the Xplore SOAP WebService
// We will use:
// - NSURL: location of the web application
// - NSURLRequest: all the data to communicate with the webserver
// - NSURLConnection: to make the connection to the webserver, sending the info in NSURLRequest
//                    and gathering the response from the server


- (void)fecthData
{
    dNSLog(@"\t[SAxReq] Fetching data from Webservice");
    dNSLog(@"\t[SAxReq]  -> URL: http://saxm.comscore.com/DataProviderService.svc");
    //Create a new data container for the stuff that comes back from the service
    xmlData = [[NSMutableData alloc]init];
    
    // Construct a ULR that will ask the service what you want
    NSURL *url = [NSURL URLWithString:@"http://saxm.comscore.com/DataProviderService.svc"];
    
    // Put that request into a NSURLRequest
    NSURLRequest *req = [[NSURLRequest alloc]initWithURL:url];
    
    // Create a connection that will exchange this request for data from the URL
    connection = [[NSURLConnection alloc]initWithRequest:req delegate:self startImmediately:YES];
    
}


// The delegate of an NSURLConnection is responsible for overseeing the connection and for
// collecting the data returned from the request. (XML in our case). However, the data returned
// usually comes back in pieces, and it is the delegate’s job to collect the pieces and put
// them together. Implementing here.
// This method will be called several times as the data arrives
- (void) connection:( NSURLConnection *) conn didReceiveData:( NSData *) data
{
    dNSLog(@"\t[SAxReq]  -> Received a chunk of data...");
    // Add the incoming chunk of data to the container we are keeping
    // The data always comes in the correct order
    [xmlData appendData:data];
}

// When a connection has finished retrieving all of the data from a web service, it sends the
// message connectionDidFinishLoading: to its delegate. In this method, you are guaranteed to
// have the complete response from the web service request and can start working with that data.
- (void) connectionDidFinishLoading:( NSURLConnection *) conn
{ // We are just checking to make sure we are getting the XML
    NSString *xmlCheck = [[ NSString alloc]
                          initWithData:xmlData encoding:NSUTF8StringEncoding];
    dNSLog(@"\t[SAxReq] Data fetching finished");
    dNSLog(@"\t[SAxReq]  -> Response= %@", xmlCheck);

}


// There is a possibility that a connection will fail. If an instance of NSURLConnection cannot
// make a connection to a web service, it sends its delegate the message
// connection:didFailWithError:. Note that this message gets sent for a connection failure,
// like having no Internet connectivity or if the server doesn’t exist.
// For other types of errors, such as data sent to a web service in the wrong format, the error
// information is returned in connection:didReceiveData:.
- (void) connection:( NSURLConnection *) conn didFailWithError:( NSError *) error
{
    // Release the connection object, we're done with it
    connection = nil;
    
    // Release the xmlData object, we're done with it
    xmlData = nil;
    
    // Grab the description of the error object passed to us
    NSString *errorString = [NSString stringWithFormat:@" Fetch failed: %@",
                             [error localizedDescription]];
    
    // Create and show an alert view with this error displayed
    UIAlertView *av = [[ UIAlertView alloc] initWithTitle:@" Error"
                                                  message:errorString delegate:nil cancelButtonTitle:@" OK" otherButtonTitles:nil];
    [av show];
    
}

@end
