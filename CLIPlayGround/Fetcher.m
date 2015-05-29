//
//  Fetcher.m
//  CLIPlayGround
//
//  Created by Zhang Naville on 15/5/10.
//  Copyright (c) 2015年 Naville. All rights reserved.
//

#import "Fetcher.h"

@implementation Fetcher:NSURLConnection
+(NSData*)FetchData:(NSURL*)STOREURL{
    NSURLRequest* nur=[NSURLRequest requestWithURL:STOREURL cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30];
    NSError* err;
    NSData   *data = [NSURLConnection sendSynchronousRequest:nur returningResponse:nil error:&err];
    if(err!=nil){
        NSLog(@"Error!%@",[err localizedDescription]);
        
    }
    return data;
    
}
@end
