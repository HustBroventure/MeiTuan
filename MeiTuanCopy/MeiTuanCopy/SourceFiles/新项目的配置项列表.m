//
//  新项目的配置项列表.m
//  HBProjectDemo
//
//  Created by wangfeng on 16/1/25.
//  Copyright © 2016年 HustBroventurre. All rights reserved.
//

#import <Foundation/Foundation.h>

//新开一个新的项目，往往需要以下的配置
#pragma mark - 1.iOS9 网络连接

    //如果你发现你的项目的网络连接,调不通试试看是不是这个没有配置
    //编辑器打开Info.plist,最后添加

#pragma mark <key>NSAppTransportSecurity</key><dict><key>NSAllowsArbitraryLoads</key><true/><dict>


#pragma mark - 2.设置application控制状态栏

    //View controller-based status bar appearance   NO


#pragma mark - 3.设置地理位置信息

//<key>NSLocationAlwaysUsageDescription</key>
//<string>您的描述</string>
//<key>NSLocationWhenInUseUsageDescription</key>
//<string>您的描述</string>

#pragma mark - 4.设置应用名，设置语言地区(如果不是多语言版本的话)

//Bundle display name   您的应用名
//Localization native development region China


#pragma mark - 5. 3DTouch的shortCut功能（静态添加）

//添加UIApplicationShortcutItems 数组，item为字典类型，包含以下三个属性
//UIApplicationShortcutItemIconFile
//UIApplicationShortcutItemTitle
//UIApplicationShortcutItemType

#pragma mark - 6. pch文件的使用

//在pch中定义宏，添加全局包含的头文件
//1)新建pch文件
//2)build setting中查找prefixheader
//
//$(SRCROOT)/项目名/PrefixHeader.pch

//自定义Log,放入pch文件

#ifdef DEBUG
#define ECLog(...) NSLog(@"文件：%s行号:%d方法名:%s\n %@\n\n",__FILE__,__LINE__,__func__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define ECLog(...)
#endif

#pragma mark - 7. 宏的使用举例

#if TARGET_IPHONE_SIMULATOR
#define HOST_NAME  @"127.0.0.1"
#elif TARGET_OS_IPHONE
#define HOST_NAME  @"192.168.1.242"
#endif

    //当前版本大于iOS8.4
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_8_4


#endif