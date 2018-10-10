//
//  Minkasu2FAConfig.h
//  Minkasu2FA
//
//  Created by Praveena Khanna on 6/28/18.
//  Copyright © 2018 minkasu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Minkasu2FACustomerInfo.h"
#import "Minkasu2FAOrderInfo.h"
#import "Minkasu2FACustomTheme.h"

@interface Minkasu2FAConfig : NSObject

extern NSString * const PRODUCTION_MODE;
extern NSString * const SANDBOX_MODE;

@property NSString *merchantId;
@property NSString *merchantCustomerId;
@property Minkasu2FACustomerInfo *customerInfo;
@property Minkasu2FAOrderInfo *orderInfo;
@property NSString *merchantToken;
@property NSString *sdkmode;
@property Minkasu2FACustomTheme *customTheme;

@end
