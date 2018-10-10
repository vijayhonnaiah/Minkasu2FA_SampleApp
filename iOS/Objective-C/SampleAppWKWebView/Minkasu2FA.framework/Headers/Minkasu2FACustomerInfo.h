//
//  Minkasu2FACustomerInfo.h
//  Minkasu2FA
//
//  Created by Praveena Khanna on 6/28/18.
//  Copyright © 2018 minkasu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Minkasu2FAAddress.h"

@interface Minkasu2FACustomerInfo : NSObject

@property NSString *firstName;
@property NSString *lastName;
@property NSString *middleName;
@property NSString *email;
@property NSString *phone;
@property Minkasu2FAAddress *address;

-(NSMutableDictionary *)dictionary;

@end
