//
//  WBShareSDKConfig.m
//  Pods-WBShareSDKHelperKit_Example
//
//  Created by Mr_Lucky on 2018/8/30.
//

#import "WBShareSDKConfig.h"

static WBShareSDKConfig *instance = nil;

@implementation WBShareSDKConfig

+ (instancetype)shareConfig {
    if (!instance) {
        instance = [[self alloc]init];
    }
    return instance;
}

@end
