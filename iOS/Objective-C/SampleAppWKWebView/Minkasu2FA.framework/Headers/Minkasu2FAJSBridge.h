//
//  Minkasu2FAJSBridge.h
//  Minkasu2FA
//
//  Created by Sachin Selvaraj on 6/19/18.
//  Copyright © 2018 minkasu. All rights reserved.
//

#import <WebKit/WebKit.h>
#import "Minkasu2FAConfig.h"
#import "ConfigInfo.h"

NS_ASSUME_NONNULL_BEGIN

@interface Minkasu2FAJSBridge : NSObject

@property ConfigInfo *configInfo;

+ (NSArray *)listOfJSBridgeMethods;
+ (instancetype)sharedInstance;
- (instancetype)initWithCongfiguration:(Minkasu2FAConfig *) config;
- (void) setMinkasu2FAConfiguration:(Minkasu2FAConfig *) config;
- (void) mk2faPerformPhoneNumCheckWithPhoneNum:(NSDictionary *) dict;
- (void) mk2faPerformNetBankingLoginAuth:(NSDictionary *) bankData;
- (void) mk2faPerformNetBankingAuth:(NSDictionary *) bankData;
- (void) mk2faPerformCardAuth:(NSDictionary *) bankData;

@end

NS_ASSUME_NONNULL_END
