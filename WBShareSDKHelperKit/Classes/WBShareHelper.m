//
//  WBShareHelper.m
//  Start
//
//  Created by Mr_Lucky on 2018/8/30.
//  Copyright © 2018年 jmw. All rights reserved.
//

#import "WBShareHelper.h"

@implementation WBShareHelper

+ (BOOL)wb_shareSDKApplication:(UIApplication *)application
 didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
                        config:(WBShareSDKConfig *)config {
    if (!config) {
        return NO;
    }
    
    [ShareSDK registPlatforms:^(SSDKRegister *platformsRegister) {
        //QQ
        [platformsRegister setupQQWithAppId:config.qqSDKAppId
                                     appkey:config.qqSDKAppKey];
        //微信
        [platformsRegister setupWeChatWithAppId:config.wechatSDKAppId
                                      appSecret:config.wechatSDKAppSecret
                                  universalLink:config.wechatUniversalLink];
        //新浪
        [platformsRegister setupSinaWeiboWithAppkey:config.sinaSDKAppKey
                                          appSecret:config.sinaSDKAppSecret
                                        redirectUrl:config.sinaSDKRedirectURL];
    }];
    return YES;
}

+ (void)wb_shareWithPlatform:(SSDKPlatformType)platform
                        text:(NSString *)text
                      images:(id)images
                         url:(NSString *)url
                       title:(NSString *)title
                        type:(SSDKContentType)type
              onStateChanged:(SSDKShareStateChangedHandler)onStateChanged {
    NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
    [shareParams SSDKSetupShareParamsByText:text
                                     images:images
                                        url:[NSURL URLWithString:url]
                                      title:title
                                       type:type];
    [self wb_shareWithPlatform:platform
                    parameters:shareParams
                onStateChanged:onStateChanged];
}

+ (void)wb_shareWithPlatform:(SSDKPlatformType)platform
                  parameters:(NSMutableDictionary *)parameters
              onStateChanged:(SSDKShareStateChangedHandler)onStateChanged {
    [ShareSDK share:platform
         parameters:parameters
     onStateChanged:onStateChanged];
}

+ (void)wb_showShareActionSheetWithText:(NSString *)text
                                 images:(id)images
                                    url:(NSString *)url
                                  title:(NSString *)title
                   directSharePlatforms:(NSArray *)directSharePlatforms
                          configuration:(SSUIShareSheetConfiguration *)configuration
                         onStateChanged:(SSUIShareStateChangedHandler)onStateChanged {
    SSUIShareSheetConfiguration *config;
    if (configuration) {
        config = configuration;
    }else {
        config = [SSUIShareSheetConfiguration new];
        //设置分享菜单为简洁样式
        config.style = SSUIActionSheetStyleSimple;
        //设置竖屏有多少个item平台图标显示
        config.columnPortraitCount = 3;
        //设置横屏有多少个item平台图标显示
//        config.columnLandscapeCount = 3;
        //设置取消按钮标签文本颜色
        config.cancelButtonTitleColor = [UIColor blackColor];
        //设置标题文本颜色
        config.itemTitleColor = [UIColor blackColor];
        //设置分享菜单栏状态栏风格
        config.statusBarStyle = UIStatusBarStyleDefault;
        //设置支持的页面方向（单独控制分享菜单栏）
        config.interfaceOrientationMask = UIInterfaceOrientationMaskPortrait;
        //设置分享菜单栏的背景颜色
        config.menuBackgroundColor = [UIColor colorWithRed:255 / 255.0
                                                     green:255 / 255.0
                                                      blue:255 / 255.0
                                                     alpha:1.f];        
        //设置直接分享的平台（不弹编辑界面）
        if (!directSharePlatforms) {
            directSharePlatforms = @[@(SSDKPlatformSubTypeWechatSession),
                                     @(SSDKPlatformSubTypeWechatTimeline),
                                     @(SSDKPlatformTypeQQ),
                                     @(SSDKPlatformTypeSinaWeibo),
                                     @(SSDKPlatformSubTypeWechatFav)];
        }
        config.directSharePlatforms = directSharePlatforms;
    }
    
    NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
    [shareParams SSDKSetupShareParamsByText:text
                                     images:images
                                        url:[NSURL URLWithString:url]
                                      title:title
                                       type:SSDKContentTypeAuto];
    
    [ShareSDK showShareActionSheet:nil
                       customItems:nil
                       shareParams:shareParams
                sheetConfiguration:config
                    onStateChanged:onStateChanged];
}



@end
