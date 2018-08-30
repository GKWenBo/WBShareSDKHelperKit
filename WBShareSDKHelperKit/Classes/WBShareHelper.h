//
//  WBShareHelper.h
//  Start
//
//  Created by Mr_Lucky on 2018/8/30.
//  Copyright © 2018年 jmw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WBShareSDKConfig.h"

/** << 导入头文件 > */
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>
/** << 腾讯开放平台（对应QQ和QQ空间）SDK头文件 > */
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>
/** << 微信SDK头文件 > */
#import "WXApi.h"
/*  < 微博头文件 > */
#import <WeiboSDK.h>

#import <ShareSDKUI/ShareSDKUI.h>

@interface WBShareHelper : NSObject

/**
 注册ShareSDK，在程序didFinishLaunchingWithOptions中调用
 
 @param application application description
 @param launchOptions launchOptions description
 @return return value description
 */
+ (BOOL)wb_shareSDKApplication:(UIApplication *)application
 didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
                        config:(WBShareSDKConfig *)config;

/**
 通用分享

 @param platform 分享平台
 @param text 内容
 @param images 图片
 @param url 地址
 @param title 标题
 @param type 分享类型
 @param onStateChanged 状态回调
 */
+ (void)wb_shareWithPlatform:(SSDKPlatformType)platform
                        text:(NSString *)text
                      images:(id)images
                         url:(NSString *)url
                       title:(NSString *)title
                        type:(SSDKContentType)type
              onStateChanged:(SSDKShareStateChangedHandler)onStateChanged;

/**
 基础分享方法

 @param platform 分享平台
 @param parameters 分享参数
 @param onStateChanged 状态回调
 */
+ (void)wb_shareWithPlatform:(SSDKPlatformType)platform
                  parameters:(NSMutableDictionary *)parameters
              onStateChanged:(SSDKShareStateChangedHandler)onStateChanged;

/**
 SDK自带UI分享

 @param text 内容
 @param images 图片
 @param url 地址
 @param title 标题
 @param directSharePlatforms 直接分享平台
 @param configuration UI配置
 @param onStateChanged 状态回调
 */
+ (void)wb_showShareActionSheetWithText:(NSString *)text
                                 images:(id)images
                                    url:(NSString *)url
                                  title:(NSString *)title
                   directSharePlatforms:(NSArray *)directSharePlatforms
                          configuration:(SSUIShareSheetConfiguration *)configuration
                         onStateChanged:(SSUIShareStateChangedHandler)onStateChanged;

@end
