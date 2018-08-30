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
    [ShareSDK registerActivePlatforms:config.platforms
                             onImport:^(SSDKPlatformType platformType)
     {
         switch (platformType)
         {
             case SSDKPlatformTypeWechat:
                 [ShareSDKConnector connectWeChat:[WXApi class]];
                 break;
             case SSDKPlatformTypeQQ:
                 [ShareSDKConnector connectQQ:[QQApiInterface class] tencentOAuthClass:[TencentOAuth class]];
                 break;
             case SSDKPlatformTypeSinaWeibo:
                 [ShareSDKConnector connectWeibo:[WeiboSDK class]];
                 break;
             default:
                 break;
         }
     }
                      onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo)
     {
         switch (platformType)
         {
             case SSDKPlatformTypeSinaWeibo:
                 //设置新浪微博应用信息,其中authType设置为使用SSO＋Web形式授权
                 [appInfo SSDKSetupSinaWeiboByAppKey:config.SinaSDKAppKey
                                           appSecret:config.SinaSDKAppSecret
                                         redirectUri:config.SinaSDKRedirectURL
                                            authType:SSDKAuthTypeBoth];
                 break;
             case SSDKPlatformTypeWechat:
                 [appInfo SSDKSetupWeChatByAppId:config.WeChatSDKAppId
                                       appSecret:config.WeChatSDKAppSecret];
                 break;
             case SSDKPlatformTypeQQ:
                 [appInfo SSDKSetupQQByAppId:config.QQSDKAppId
                                      appKey:config.QQSDKAppKey
                                    authType:SSDKAuthTypeBoth];
                 break;
             default:
                 break;
         }
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
