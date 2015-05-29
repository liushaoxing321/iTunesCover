//
//  Fetcher.h
//  CLIPlayGround
//
//  Created by Zhang Naville on 15/5/10.
//  Copyright (c) 2015年 Naville. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fetcher : NSURLConnection<NSURLConnectionDataDelegate>
+(NSData*)FetchData:(NSURL*)STOREURL;
@end
