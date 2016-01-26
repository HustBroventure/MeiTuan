//
//  HBCommonAlert.m
//  HBHttpRequestDemo
//
//  Created by wangfeng on 16/1/15.
//  Copyright © 2016年 HustBroventure. All rights reserved.
//

#import "HBCommonAlert.h"
#import "MBProgressHUD.h"

@implementation HBCommonAlert
+(void)showMessage:(NSString *)message
{
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    [self showMessage:message inView:window];
    
}
+(void)showMessage:(NSString *)message inView:(UIView*)view
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = message;
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2.f];
}

+(void)showProgresssWithMessage:(NSString *)message
{
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    [HBCommonAlert showProgresssWithMessage:message inView:window];
}
+(void)showProgresssWithMessage:(NSString *)message inView:(UIView *)view
{
    MBProgressHUD* hub = [[MBProgressHUD alloc]initWithView:view];
    hub.mode = MBProgressHUDModeIndeterminate;
    hub.labelText = message;
    hub.removeFromSuperViewOnHide = YES;
    [view addSubview:hub];
    [hub show:YES];
}
+(void)hideProgress
{
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    
    [MBProgressHUD hideHUDForView:window animated:YES];
}
+(void)hideProgressInView:(UIView *)view
{
    [MBProgressHUD hideHUDForView:view animated:YES];
}

+(void)showSuccessWithMessage:(NSString *)message inView:(UIView *)view
{
    [HBCommonAlert showMessage:message image:@"MBProgressHUD.bundle/success" inView:view];
    
}
+(void)showErrorWithMessage:(NSString *)message inView :(UIView *)view
{
    [HBCommonAlert showMessage:message image:@"MBProgressHUD.bundle/failure" inView:view];
}
+(void)showMessage:(NSString *)message image:(NSString*)imageName inView:(UIView *)view
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = message;
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    hud.mode = MBProgressHUDModeCustomView;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:1.2];
    
}


+ (void)showAlertMess:(NSString *)text
{
    [HBCommonAlert showAlertMess:text withTitle:nil];
}
+ (void)showAlertTitle:(NSString *)title
{
    [HBCommonAlert showAlertMess:nil withTitle:title];
}
+ (void)showAlertMess:(NSString *)text withTitle:(NSString*)title
{
    [HBCommonAlert showAlertMess:text withTitle:title andButton:@"确定"];
}
+ (void)showAlertMess:(NSString *)text withTitle:(NSString*)title andButton:(NSString*)button
{
    if ([UIDevice currentDevice].systemVersion.floatValue < 8.0) {
        UIAlertView* alert = [[UIAlertView alloc]initWithTitle:title message:text delegate:nil cancelButtonTitle:button otherButtonTitles:nil, nil];
        [alert show];
        return;
    }else{
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:title message:text preferredStyle:1];
        UIAlertAction* action =   [UIAlertAction actionWithTitle:button style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:action];
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
        
    }
    
}


@end
