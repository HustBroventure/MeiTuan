//
//  BaseTabBarController.m
//  MeiTuanCopy
//
//  Created by wangfeng on 16/1/27.
//  Copyright © 2016年 HustBroventure. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseNavigationController.h"
#import "MTFrontPageViewController.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tabBar.tintColor = BASE_STYLE_COLOR;
    
    BaseNavigationController* baseNavi_0 = [[BaseNavigationController alloc]initWithRootViewController:[MTFrontPageViewController new]];
    BaseNavigationController* baseNavi_1 = [[BaseNavigationController alloc]initWithRootViewController:[UIViewController new]];
    BaseNavigationController* baseNavi_2 = [[BaseNavigationController alloc]initWithRootViewController:[UIViewController new]];
    BaseNavigationController* baseNavi_3 = [[BaseNavigationController alloc]initWithRootViewController:[UIViewController new]];
    self.viewControllers = @[baseNavi_0,baseNavi_1,baseNavi_2,baseNavi_3];
    
    
    
    
    UITabBarItem* item_0 = self.tabBar.items[0];
    item_0.title = @"首页";
    item_0.image = [[UIImage imageNamed:@"icon_tab_shouye_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item_0.selectedImage = [[UIImage imageNamed:@"icon_tab_shouye_highlight"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem* item_1 = self.tabBar.items[1];
    item_1.title = @"商家";
    item_1.image = [[UIImage imageNamed:@"icon_tab_fujin_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item_1.selectedImage = [[UIImage imageNamed:@"icon_tab_fujin_highlight"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem* item_2 = self.tabBar.items[2];
    item_2.title = @"我的";
    item_2.image = [[UIImage imageNamed:@"tab_icon_selection_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item_2.selectedImage = [[UIImage imageNamed:@"tab_icon_selection_highlight"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UITabBarItem* item_3 = self.tabBar.items[3];
    item_3.title = @"更多";
    item_3.image = [[UIImage imageNamed:@"icon_tab_wode_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item_3.selectedImage = [[UIImage imageNamed:@"icon_tab_wode_highlight"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    

}


@end
