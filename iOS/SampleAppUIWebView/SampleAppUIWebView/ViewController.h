//
//  ViewController.h
//  SampleAppUIWebView
//
//  Created by Praveena Khanna on 10/9/18.
//  Copyright © 2018 minkasu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Minkasu2FA/Minkasu2FAHeader.h>

@interface ViewController : UIViewController<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *btnNetBanking;
@property (weak, nonatomic) IBOutlet UIButton *btnCreditDebit;
@property (nonatomic)  UIWebView *uiWebView;

@property (nonatomic) Minkasu2FA *minkasu2fa;

- (IBAction)clickNetBanking:(id)sender;
- (IBAction)clickCreditDebit:(id)sender;

@end

