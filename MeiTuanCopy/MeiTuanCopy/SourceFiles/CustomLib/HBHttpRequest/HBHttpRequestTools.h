//
//  HBHttpRequestTools.h
//  HBHttpRequestDemo
//
//  Created by wangfeng on 16/1/15.
//  Copyright © 2016年 HustBroventure. All rights reserved.
//

#import "HBBaseHttpRequest.h"

@interface HBHttpRequestTools : HBBaseHttpRequest


-(void)postRequestWithPath:(NSString*)path Para:(NSDictionary*)padDic finishBlock:(FinishHandlerBlock)handlerBlock;

@end
