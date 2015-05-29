//
//  main.m
//  CLIPlayGround
//
//  Created by Zhang Naville on 15/4/22.
//  Copyright (c) 2015年 Naville. All rights reserved.
//
#import <objc/runtime.h>
#import <Foundation/Foundation.h>
#import "CocoaSecurity.h"
#import "Fetcher.h"
#define RegularExpression @"(http:\/\/(:?.*?)mzstatic.com[^\"]*(170|255|326)x(170|255|326)(-75|).jp(e|)g)"
//NSUInteger* i=1;
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        asm("nop");
                asm("nop");
                asm("nop");
                asm("nop");
        
        NSLog(@"iTunesCover+PATH TO ITUNESPAGE+OUTPUT DIRECTORY");
        NSLog(@"Designed By Naville.Zhang");
        NSError* e;
        NSString* outpath=[NSString stringWithUTF8String:argv[2]];
        asm("nop");
        asm("nop");
        asm("nop");
        asm("nop");
    NSMutableString* input=[NSMutableString stringWithContentsOfURL:[NSURL URLWithString:[NSString stringWithUTF8String:argv[1]]] encoding:NSUTF8StringEncoding error:&e];
       // NSLog(@"%@:Error:%@",input,e.localizedDescription);
       // NSLog(input);
        while ([input rangeOfString:RegularExpression options:NSRegularExpressionSearch].location!=NSNotFound) {
            NSRange Range=[input rangeOfString:RegularExpression options:NSRegularExpressionSearch];
            NSRange albumrange=[input rangeOfString:@"<meta content=\".*?\" property=\"og:title\" />" options:NSRegularExpressionSearch];
            NSString* ALBUMNAME=[input substringWithRange:albumrange];
            ALBUMNAME=[ALBUMNAME stringByReplacingOccurrencesOfString:@"<meta content=\"" withString:@""];
              ALBUMNAME=[ALBUMNAME stringByReplacingOccurrencesOfString:@"\" property=\"og:title\" />" withString:@""];
            NSLog(@"Album Name is:%@",ALBUMNAME);
            ALBUMNAME=[ALBUMNAME stringByReplacingOccurrencesOfString:@"/" withString:@"-"];
            NSString* tmpurlstring=[input substringWithRange:Range];
            NSString* filetype=[tmpurlstring substringFromIndex:tmpurlstring.length-4];
            if([filetype isEqualToString:@"jpeg"]){
                filetype=@".jpeg";
                
            }
            if([filetype isEqualToString:@".png"]){
                filetype=@".png";
                
            }
            NSLog(@"%@",filetype);
            NSURL* dlurl=[NSURL URLWithString:[[input substringWithRange:Range] stringByReplacingOccurrencesOfString:@"326x326" withString:@"1400x1400"]];
           
            NSData* data;
            data=[Fetcher FetchData:dlurl];
          if(dlurl!=nil&&[[NSString stringWithContentsOfURL:dlurl encoding:NSUTF8StringEncoding error:nil] containsString:@"<!DOCTYPE"]==false){
                NSLog(@"1400*1400 Found");
                           NSString* writepath=[NSString stringWithFormat:@"%@/%@%@",outpath,ALBUMNAME,filetype];
                [data writeToFile:writepath atomically:YES];
                       NSLog(@"Finished");
                exit(0);
            }
            else{
                NSLog(@"1400*1400 Not Found");
                
            }
            dlurl=[NSURL URLWithString:[[input substringWithRange:Range] stringByReplacingOccurrencesOfString:@"326x326" withString:@"1200x1200"]];
            
            
            data=[Fetcher FetchData:dlurl];
   if(dlurl!=nil&&[[NSString stringWithContentsOfURL:dlurl encoding:NSUTF8StringEncoding error:nil] containsString:@"<!DOCTYPE"]==false){
                NSLog(@"1200*1200 Found");
                NSString* writepath=[NSString stringWithFormat:@"%@/%@%@",outpath,ALBUMNAME,filetype];
                [data writeToFile:writepath atomically:YES];
                NSLog(@"Finished");
                exit(0);
            } else{
                NSLog(@"1200*1200 Not Found");
                
            }
           dlurl=[NSURL URLWithString:[[input substringWithRange:Range] stringByReplacingOccurrencesOfString:@"326x326" withString:@"800x800"]];
            
      
            data=[Fetcher FetchData:dlurl];
            if(dlurl!=nil&&[[NSString stringWithContentsOfURL:dlurl encoding:NSUTF8StringEncoding error:nil] containsString:@"<!DOCTYPE"]==false){
                NSLog(@"800*800 Found");
    NSString* writepath=[NSString stringWithFormat:@"%@/%@%@",outpath,ALBUMNAME,filetype];
                [data writeToFile:writepath atomically:YES];
                NSLog(@"Finished");
                exit(0);
            }
            else{
                NSLog(@"800*800 Not Found");
                
            }
            dlurl=[NSURL URLWithString:[[input substringWithRange:Range] stringByReplacingOccurrencesOfString:@"326x326" withString:@"600x600"]];
            
            
            data=[Fetcher FetchData:dlurl];
     if(dlurl!=nil&&[[NSString stringWithContentsOfURL:dlurl encoding:NSUTF8StringEncoding error:nil] containsString:@"<!DOCTYPE"]==false){
                NSLog(@"600*600 Found");
                             NSString* writepath=[NSString stringWithFormat:@"%@/%@%@",outpath,ALBUMNAME,filetype];
                [data writeToFile:writepath atomically:YES];
                NSLog(@"Finished");
                exit(0);
            } else{
                NSLog(@"600*600 Not Found");
                
            }


            
            
            
        //    [data writeToFile:writepath atomically:YES];
            
            
            
            input=[NSMutableString stringWithString:[input stringByReplacingCharactersInRange:Range withString:@""]];
            
            break;
    
        }
        NSLog(@"Sorry.Not Found");
    }
    return 0;
}
