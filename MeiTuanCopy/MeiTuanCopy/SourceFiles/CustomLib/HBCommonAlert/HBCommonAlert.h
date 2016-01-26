//
//  HBCommonAlert.h
//  HBHttpRequestDemo
//
//  Created by wangfeng on 16/1/15.
//  Copyright © 2016年 HustBroventure. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface HBCommonAlert : NSObject
    //显示纯文字信息
+(void)showMessage:(NSString*)message;
+(void)showMessage:(NSString*)message inView:(UIView*)view;
    //显示成功信息，在window中显示
+(void)showSuccessWithMessage:(NSString*)message inView:(UIView *)view;
    //显示失败信息，，在window中显示
+(void)showErrorWithMessage:(NSString*)message inView:(UIView *)view;

    //显示菊花过程框
+(void)showProgresssWithMessage:(NSString*)message;
+(void)hideProgress;
+(void)showProgresssWithMessage:(NSString*)message inView:(UIView*)view;
+(void)hideProgressInView:(UIView*)view;

    //显示alert弹框
+ (void)showAlertMess:(NSString *)text;
+ (void)showAlertTitle:(NSString *)title;
+ (void)showAlertMess:(NSString *)text withTitle:(NSString*)title;
+ (void)showAlertMess:(NSString *)text withTitle:(NSString*)title andButton:(NSString*)button;
@end
