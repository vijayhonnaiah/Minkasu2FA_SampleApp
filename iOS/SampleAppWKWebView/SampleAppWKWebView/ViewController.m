//
//  ViewController.m
//  SampleAppWKWebView
//
//  Created by Praveena Khanna on 10/9/18.
//  Copyright © 2018 minkasu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    //Initializing WKWebView
    WKWebViewConfiguration *theConfiguration = [[WKWebViewConfiguration alloc] init];
    self.wkWebView = [[WKWebView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y+150, self.view.frame.size.width, self.view.frame.size.height) configuration:theConfiguration];
    _wkWebView.UIDelegate = self;
}

#pragma mark WKWebView Methods
//Handles the JavaScript Alert in Native iOS App
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler {
    
    //Set Alert Title in Alert Pop-Up as "Minkasu Alert"
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alert" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    //Display OK in Pop-Up and close Pop-Up when OK Button is pressed (espace completion handler)
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler();
    }];
    
    //Present Alert from Context
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:TRUE completion:nil];
}

- (void) initMinkasu2FA{
    Minkasu2FACustomerInfo *customer = [Minkasu2FACustomerInfo new];
    Minkasu2FAAddress *address = [Minkasu2FAAddress new];
    Minkasu2FAOrderInfo *orderInfo = [Minkasu2FAOrderInfo new];
    Minkasu2FAConfig *config = [Minkasu2FAConfig new];
    
    customer.firstName = @"TestCustomer";
    customer.lastName = @"TestLastName";
    customer.email = @"test@minkasupay.com";
    customer.phone = @"+919876543210";
    address.line1 = @"123 Test way";
    address.line2 = @"Test Soc";
    address.city = @"Mumbai";
    address.state = @"Maharashtra";
    address.country= @"India";
    address.zipCode = @"400068";
    customer.address = address;
    
    config.merchantId = @"13579";
    //config.merchantToken = @"9fe3cee1024c3c7a071f3c8d9b6abe3d";
    //config.merchantToken = @"4651abb43d771a2a2538a08b2c60f6df";//Prod-13579
    config.merchantToken = @"c4f1f1a90eb1c09825ca38ef9ca6eeaa";//Dev-13579
    
    //Use this to set custom color theme
    Minkasu2FACustomTheme *mkcolorTheme = [Minkasu2FACustomTheme new];
    mkcolorTheme.navigationBarColor = UIColor.blueColor;
    mkcolorTheme.navigationBarTextColor = UIColor.whiteColor;
    mkcolorTheme.buttonBackgroundColor = UIColor.blueColor;
    mkcolorTheme.buttonTextColor = UIColor.whiteColor;
    config.customTheme = mkcolorTheme;
    //set the color theme to nil if you want use the minkasu2fa default color scheme
    //config.mk2faColorTheme = nil;
    
    config.merchantCustomerId = @"M_C001";
    config.customerInfo = customer;
    
    config.sdkmode = SANDBOX_MODE;
    orderInfo.orderId = @"Order01-001";
    config.orderInfo = orderInfo;
    _minkasu2fa = [[Minkasu2FA alloc] init];
    
    //Initializing WKWebView
    [Minkasu2FA initWithWKWebView:_wkWebView andConfiguration:config];
    [self.view addSubview:_wkWebView];
    
}


- (IBAction)clickNetBanking:(id)sender {
    [self initMinkasu2FA];
    NSURL *nsurl=[NSURL URLWithString:@"https://dev.minkasupay.com/demo/Bank_Internet_Banking_login.htm"];
    NSURLRequest *nsrequest=[NSURLRequest requestWithURL:nsurl];
    [_wkWebView loadRequest:nsrequest];
}

- (IBAction)clickCreditDebit:(id)sender {
    [self initMinkasu2FA];
    NSURL *nsurl=[NSURL URLWithString:@"https://dev.minkasupay.com/demo/Welcome_to_Net.html?minkasu2FA=true"];
    NSURLRequest *nsrequest=[NSURLRequest requestWithURL:nsurl];
    [_wkWebView loadRequest:nsrequest];
}

@end
