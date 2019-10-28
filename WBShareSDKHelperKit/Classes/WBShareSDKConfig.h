//
//  WBShareSDKConfig.h
//  Pods-WBShareSDKHelperKit_Example
//
//  Created by Mr_Lucky on 2018/8/30.
//

#import <Foundation/Foundation.h>

@interface WBShareSDKConfig : NSObject

+ (instancetype)shareConfig;

// MARK:ShareSDK
/**
 注册平台 默认：QQ、微信、新浪微博
 */
@property (nonatomic, strong) NSArray *platforms;

@property (nonatomic, copy) NSString *wechatSDKAppId;
@property (nonatomic, copy) NSString *wechatSDKAppSecret;
@property (nonatomic, copy) NSString *wechatSDKRedirectURL;
///微信深度链接
@property (nonatomic, copy) NSString *wechatUniversalLink;

@property (nonatomic, copy) NSString *qqSDKAppId;
@property (nonatomic, copy) NSString *qqSDKAppKey;

@property (nonatomic, copy) NSString *sinaSDKAppKey;
@property (nonatomic, copy) NSString *sinaSDKAppSecret;
@property (nonatomic, copy) NSString *sinaSDKRedirectURL;

@end
