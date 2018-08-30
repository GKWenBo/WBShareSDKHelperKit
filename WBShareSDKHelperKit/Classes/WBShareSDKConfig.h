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

@property (nonatomic, copy) NSString *WeChatSDKAppId;
@property (nonatomic, copy) NSString *WeChatSDKAppSecret;
@property (nonatomic, copy) NSString *WeChatSDKRedirectURL;

@property (nonatomic, copy) NSString *QQSDKAppId;
@property (nonatomic, copy) NSString *QQSDKAppKey;

@property (nonatomic, copy) NSString *SinaSDKAppKey;
@property (nonatomic, copy) NSString *SinaSDKAppSecret;
@property (nonatomic, copy) NSString *SinaSDKRedirectURL;

@end
