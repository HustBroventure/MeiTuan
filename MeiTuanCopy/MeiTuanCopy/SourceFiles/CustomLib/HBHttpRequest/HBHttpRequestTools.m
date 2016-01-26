//
//  HBHttpRequestTools.m
//  HBHttpRequestDemo
//
//  Created by wangfeng on 16/1/15.
//  Copyright © 2016年 HustBroventure. All rights reserved.
//

#import "HBHttpRequestTools.h"

@implementation HBHttpRequestTools

-(void)requestForTodayWeatherInfoWithPara:(NSDictionary*)padDic finishBlock:(FinishHandlerBlock)handlerBlock
{
    NSString* port= @"/telematics/v3/weather";
    [self getHttpRequest:padDic andUrl:[NSString stringWithFormat:@"%@%@",BASE_URL,port]];
    self.handlerBlock = handlerBlock;
}


-(void)getRequestWithPath:(NSString*)path Para:(NSDictionary*)padDic finishBlock:(FinishHandlerBlock)handlerBlock
{
    if (path == nil) {
        path = @"";
    }
    [self getHttpRequest:padDic andUrl:[NSString stringWithFormat:@"%@%@",BASE_URL,path]];
    self.handlerBlock = handlerBlock;
}

-(void)postRequestWithPath:(NSString*)path Para:(NSDictionary*)padDic finishBlock:(FinishHandlerBlock)handlerBlock
{
    if (path == nil) {
        path = @"";
    }
    self.handlerBlock = handlerBlock;

    [self postHttpRequest:padDic andUrl:[NSString stringWithFormat:@"%@%@",BASE_URL,path]];
}

-(void)postFileRequestWithPath:(NSString*)path Para:(NSDictionary*)padDic ProgressBlock:(ProgressBlock)progressBlock
{
    if (path == nil) {
        path = @"";
    }
    [self postHttpRequest:padDic andUrl:[NSString stringWithFormat:@"%@%@",BASE_URL,path]];
    [self postFileHttpRequest:padDic url: [NSString stringWithFormat:@"%@%@",BASE_URL,path]userName:nil progressBlock:progressBlock];
     
}
@end
