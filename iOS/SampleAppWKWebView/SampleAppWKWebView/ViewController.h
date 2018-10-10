//
//  ViewController.h
//  SampleAppWKWebView
//
//  Created by Praveena Khanna on 10/9/18.
//  Copyright © 2018 minkasu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import <Minkasu2FA/Minkasu2FAHeader.h>

@interface ViewController : UIViewController<WKUIDelegate, NSURLConnectionDataDelegate>

@property (weak, nonatomic) IBOutlet UIButton *btnNetBanking;
@property (weak, nonatomic) IBOutlet UIButton *btnCreditDebit;
@property ( nonatomic)  WKWebView *wkWebView;
@property (nonatomic) Minkasu2FA *minkasu2fa;

- (IBAction)clickNetBanking:(id)sender;
- (IBAction)clickCreditDebit:(id)sender;

@end

