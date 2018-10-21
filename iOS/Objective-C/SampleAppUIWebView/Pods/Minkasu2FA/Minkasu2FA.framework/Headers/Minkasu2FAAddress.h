//
//  Minkasu2FAAddress.h
//  Minkasu2FA
//
//  Created by Praveena Khanna on 6/28/18.
//  Copyright © 2018 minkasu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Minkasu2FAAddress : NSObject

@property NSString *line1;
@property NSString *line2;
@property NSString *line3;
@property NSString *city;
@property NSString *state;
@property NSString *zipCode;
@property NSString *country;

-(NSMutableDictionary *)dictionary;

@end
