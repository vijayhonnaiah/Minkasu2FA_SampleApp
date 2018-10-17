//
//  Minkasu2FAOperationType.h
//  Minkasu2FA
//
//  Created by Praveena Khanna on 7/13/18.
//  Copyright © 2018 minkasu. All rights reserved.
//

#ifndef Minkasu2FAOperationType_h
#define Minkasu2FAOperationType_h
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, Minkasu2FAOperationType){
    CHANGE_PAYPIN = 1,
    ENABLE_FINGERPRINT ,
    DISABLE_FINGERPRINT ,
};

#endif /* Minkasu2FAOperationType_h */
