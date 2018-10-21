//
//  Action.h
//  Minkasu2FA
//
//  Created by Praveena Khanna on 7/13/18.
//  Copyright © 2018 minkasu. All rights reserved.
//

#ifndef Action_h
#define Action_h

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, Action){
    MK_CHANGE_PIN,
    MK_ENABLE_BIOMETRY,
    MK_AUTH_PAY
};

#endif /* Action_h */
