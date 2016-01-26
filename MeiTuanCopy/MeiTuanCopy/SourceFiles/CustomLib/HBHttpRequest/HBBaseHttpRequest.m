//
//  HBBaseHttpRequest.m
//  HBHttpRequestDemo
//
//  Created by wangfeng on 16/1/15.
//  Copyright © 2016年 HustBroventure. All rights reserved.
//

#import "HBBaseHttpRequest.h"

@implementation HBBaseHttpRequest

#pragma mark - public methords

#pragma mark - private-tools methords

#pragma mark - 取得get方法URL拼接参数后的地址

-(NSString*)getFinalUrlWithBaseUrl:(NSString*)urlStr parmDic:(NSDictionary*)dic
{
    if(!urlStr){
        return nil;
    }
    if (!dic) {
        return urlStr;
    }
        //1.参数排序
    NSArray* sortedKeys = [[dic allKeys] sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 compare:obj2];
    }];
    
        //2.参数拼接
    NSMutableString* mStr = [NSMutableString string];
    for (NSString* key in sortedKeys) {
        [mStr appendFormat:@"&%@=%@",key,dic[key]];
    }
    [mStr replaceCharactersInRange:NSMakeRange(0,1) withString:@"?"];
        //3.地址和参数拼接
    NSString* finalUrl = [NSString stringWithFormat:@"%@%@",urlStr,mStr];
        //4.中文转义
    finalUrl = [self URLEncodedString:finalUrl];
    
    return finalUrl;
    
    
}
- (NSString *)URLEncodedString:(NSString*)url
{
    NSString *encodedString = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)url,
                                                              (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]",
                                                              NULL,
                                                              kCFStringEncodingUTF8));
    return encodedString;
}

#pragma mark - get异步请求

-(void)getHttpRequest:(NSDictionary *)dic andUrl:(NSString *)urlStr{
        //拼接get请求URL
    urlStr=[self getFinalUrlWithBaseUrl:urlStr parmDic:dic];
    [self getCommon:dic andUrl:urlStr userName:nil];
}

-(void)getHttpRequest:(NSDictionary *)dic andUrl:(NSString *)urlStr userName:(NSString *) userName{
        //拼接get请求URL
    urlStr=[self getFinalUrlWithBaseUrl:urlStr parmDic:dic];
    [self getCommon:dic andUrl:urlStr userName:userName];
}
    //get请求通用方法
-(void)getCommon:(NSDictionary *)dic andUrl:(NSString *)urlStr userName:(NSString *) userName{
        //URL请求
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    request.timeoutInterval=TIME_OUT_INTERVAL;
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
        //返回函数调用
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self requestSuccess:operation response:responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self requestFailed:operation error:error];
    }];
    [operation start];
}
#pragma mark - post异步请求

    //post请求
-(void)postHttpRequest:(NSDictionary *)dic andUrl:(NSString *)urlStr{
    
    [self postCommon:dic andUrl:urlStr userName:nil sign:YES];
}

-(void)postHttpRequest:(NSDictionary *)dic andUrl:(NSString *)urlStr userName:(NSString *) userName
{
    [self postCommon:dic andUrl:urlStr userName:userName sign:YES];
}


    //post上传文件
-(void)postFileHttpRequest:(NSDictionary *)dic url:(NSString *)urlStr userName:(NSString *) userName progressBlock:(ProgressBlock)progressBlock
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    
    AFHTTPRequestOperation *operation=[manager POST:urlStr  parameters:dic[@"para"] constructingBodyWithBlock:^(id<AFMultipartFormData> formData){
        [formData appendPartWithFileData:dic[@"imageData"]
                                    name:@"images"
                                fileName:@"image"
                                mimeType:@"image/png"];
    }success:^(AFHTTPRequestOperation *operation, id responseObject){
        [self requestSuccess:operation response:responseObject];
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self requestFailed:operation error:error];
    }];    //设置请求标示
    [operation setUploadProgressBlock:^(NSUInteger __unused bytesWritten,
                                        long long totalBytesWritten,
                                        long long totalBytesExpectedToWrite) {
        if (progressBlock) {
            progressBlock((float)totalBytesWritten/totalBytesExpectedToWrite);
        }
    }];
    
}

    //post请求通用方法
-(void)postCommon:(NSDictionary *)dic andUrl:(NSString *)urlStr userName:(NSString *) userName sign:(BOOL) sign{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
        //请求
    AFHTTPRequestOperation *operation=[manager POST:urlStr parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject){
        [self requestSuccess:operation response:responseObject];
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self requestFailed:operation error:error];
    }];
    [operation start];
    
    
}

#pragma mark - 请求成功处理公共方法
-(void)requestSuccess:(AFHTTPRequestOperation *) operation response:(id) responseObject{
    
    NSString* sss = [operation responseString];
    NSLog(@"%@",sss);
    NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:[operation responseData] options:NSJSONReadingMutableLeaves error:nil];
    if (dic) {
        if (self.handlerBlock) {
            self.handlerBlock(dic,SESSION_SUCCESS);
        }
    }
    
    
}

#pragma mark --请求失败处理公共方法
-(void)requestFailed:(AFHTTPRequestOperation *) operation error:(NSError *) error
{
    if (!self.handlerBlock) {
        return;
    }
        //超时
    if (error.code == 408) {
        self.handlerBlock(nil,SESSION_TIMEOUT);
        
    }else{
        self.handlerBlock(nil,OTHER_ERROR);
    }
    
}






@end
