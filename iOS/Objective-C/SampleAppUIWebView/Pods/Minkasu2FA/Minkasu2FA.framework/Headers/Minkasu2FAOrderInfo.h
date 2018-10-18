//
//  Minkasu2FAOrderInfo.h
//  Minkasu2FA
//
//  Created by Praveena Khanna on 6/28/18.
//  Copyright © 2018 minkasu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Minkasu2FAOrderInfo : NSObject

@property NSString *orderId;

-(NSMutableDictionary *)dictionary;

@end
