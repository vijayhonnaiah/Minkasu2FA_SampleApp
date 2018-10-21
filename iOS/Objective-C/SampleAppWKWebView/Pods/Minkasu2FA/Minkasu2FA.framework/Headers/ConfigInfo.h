//
//  ConfigInfo.h
//  Minkasu2FA
//
//  Created by Praveena Khanna on 6/28/18.
//  Copyright © 2018 minkasu. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "Minkasu2FAJSBridge.h"
#import "Minkasu2FACustomerInfo.h"
#import "Minkasu2FAOrderInfo.h"
#import "Action.h"
#import "BankType.h"
#import "CardType.h"
#import "PaymentType.h"
#import "NetBanking.h"
#import "PhoneHashAlg.h"
#import "Minkasu2FACustomTheme.h"
#import "Minkasu2FASDKMode.h"

@interface ConfigInfo : NSObject

@property (nonatomic, strong) NSString *merchantName;
@property (nonatomic, strong) NSString *merchantId;
@property (nonatomic, strong) NSString *merchantCustomerId;
@property (nonatomic, strong) NSString *mkMerchantToken;
@property (nonatomic, strong) NSString *merchantCustomerPhoneNo;
@property (nonatomic, strong) NSString *cancelCallBack;
@property Minkasu2FACustomerInfo *customerInfo;
@property Minkasu2FAOrderInfo *orderInfo;
@property NetBanking *netBankingInfo;
@property (nonatomic, strong) NSString *cardId;
@property (nonatomic, strong) NSString *cardAlias;
@property (nonatomic, strong) NSString *bankTxnId;

@property (nonatomic, strong) NSString *bankPhoneNumHash;
@property PhoneHashAlg bankPhoneNumHashAlg;
@property (nonatomic, strong) NSString *bankPhoneNumSalt;

@property  Action action;
@property  BOOL noAadhaar;
@property  CardType cardType;
@property  BankType bankType;
@property  PaymentType paymentType;
@property  (nonatomic, assign) NSInteger totalAmountInPaise;

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *customerEmailId;
@property (nonatomic, strong) NSString *customJsonObj;
@property (nonatomic, strong) NSString *bankTimestamp;
@property (nonatomic, strong) NSString *bankDeclaration;

@property (nonatomic, strong) NSString *bankSignature;
@property (nonatomic, strong) NSString *bankCertFingerprint;
@property (nonatomic, strong) NSString *bankCertFingerprintAlg;
@property (nonatomic, strong) NSString *bankDeclarationLocal;
@property Minkasu2FASDKMode sdkMode;
@property (nonatomic, strong) NSString *entryPoint;
@property (nonatomic, strong) NSString *disabledMerchantStr;

@property Minkasu2FACustomTheme *customTheme;
//@property Minkasu2FAJSBridge *jsInterface;


@end
