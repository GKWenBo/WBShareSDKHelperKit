#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "AppDelegate+ShareSDK.h"
#import "WBShareHelper.h"
#import "WBShareSDKConfig.h"
#import "WBShareSDKHelperKit.h"

FOUNDATION_EXPORT double WBShareSDKHelperKitVersionNumber;
FOUNDATION_EXPORT const unsigned char WBShareSDKHelperKitVersionString[];

