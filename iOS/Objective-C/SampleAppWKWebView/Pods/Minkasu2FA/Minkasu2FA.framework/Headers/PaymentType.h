//
//  PaymentType.h
//  Minkasu2FA
//
//  Created by Praveena Khanna on 7/13/18.
//  Copyright © 2018 minkasu. All rights reserved.
//

#ifndef PaymentType_h
#define PaymentType_h
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, PaymentType){
    CREDIT = 3,
    DEBIT = 2,
    NET_BANKING = 1,
};

#endif /* PaymentType_h */
