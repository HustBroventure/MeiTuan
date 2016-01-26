//
//  BaseModel.h
//  HBProjectDemo
//
//  Created by wangfeng on 16/1/25.
//  Copyright © 2016年 HustBroventurre. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject


- (instancetype)initWithDic:(NSDictionary*)dic;
- (NSDictionary*)modelStringPropertiesToDictionary;
@end
