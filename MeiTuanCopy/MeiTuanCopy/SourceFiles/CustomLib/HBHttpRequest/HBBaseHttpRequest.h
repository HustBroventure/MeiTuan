//
//  HBBaseHttpRequest.h
//  HBHttpRequestDemo
//
//  Created by wangfeng on 16/1/15.
//  Copyright © 2016年 HustBroventure. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#define BASE_URL @"http://localhost:8080"
#define TIME_OUT_INTERVAL 10;
#define TIME_OUT_INTERVAL_UPLOAD 30
typedef NS_ENUM(NSUInteger, ErrorCode) {
    SESSION_SUCCESS,
    SESSION_TIMEOUT,
    OTHER_ERROR,
};
typedef void(^FinishHandlerBlock)(NSDictionary* responseDic,ErrorCode errorCode);
typedef void(^ProgressBlock)(float percent);



@interface HBBaseHttpRequest : NSObject
@property (nonatomic, copy) FinishHandlerBlock handlerBlock;
    //get请求
-(void)getHttpRequest:(NSDictionary *)dic andUrl:(NSString *)urlStr;
-(void)getHttpRequest:(NSDictionary *)dic andUrl:(NSString *)urlStr userName:(NSString *) userName;

    //post请求
-(void)postHttpRequest:(NSDictionary *)dic andUrl:(NSString *)urlStr;
-(void)postHttpRequest:(NSDictionary *)dic andUrl:(NSString *)urlStr userName:(NSString *) userName;

    //post上传文件
-(void)postFileHttpRequest:(NSDictionary *)dic url:(NSString *)urlStr userName:(NSString *) userName progressBlock:(ProgressBlock) progressBlock;

@end
