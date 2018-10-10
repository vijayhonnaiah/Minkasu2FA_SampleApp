//
//  ViewController.m
//  SampleAppUIWebView
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
    //Initializing UIWebView
    self.uiWebView = [[UIWebView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y+150, self.view.frame.size.width, self.view.frame.size.height)];
    _uiWebView.delegate = self;
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
    
    //Initializing UIWebView
    [Minkasu2FA initWithUIWebView:_uiWebView andConfiguration:config];
    [self.view addSubview:_uiWebView];
    
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    //Return YES or NO based on wether the request is a Minkasu 2FA Bridge Function
    return ![Minkasu2FA request:request shouldHandleByMinkasu2FAInWebView:webView navigationType:navigationType];
}

- (IBAction)clickNetBanking:(id)sender {
    
    [self initMinkasu2FA];
    //NSURL *nsurl=[NSURL URLWithString:@"http://192.168.1.145:8000/demo/Bank_Internet_Banking_login.htm"];
    NSURL *nsurl=[NSURL URLWithString:@"https://dev.minkasupay.com/demo/Bank_Internet_Banking_login.htm"];
    //NSURL *nsurl=[NSURL URLWithString:@"http://192.168.1.198:8000/demo/Bank_Internet_Banking_login.htm"];
    //NSURL *nsurl=[NSURL URLWithString:@"https://203.171.211.50/corp/BANKAWAY?IWQRYTASKOBJNAME=bay_mc_login&BAY_BANKID=ICI&MD=P&PID=000000000722&QS=fFBSTj05ODgwODMyNTEwMjAxNXxJVEM9MDYyMDQwMTk2NjRUOTg4MDgzMjV8QU1UPTQuMTB8Q1JOPUlOUnxDRz1ZfFJVPWh0dHBzOi8vc2FuZGJveC5taW5rYXN1cGF5LmNvbS9kZW1vL1N1Y2Nlc3MuaHRtbA==&ACCESS_DEV=WAP"];
    NSURLRequest *nsrequest=[NSURLRequest requestWithURL:nsurl];
    [_uiWebView loadRequest:nsrequest];
}

- (IBAction)clickCreditDebit:(id)sender {
    [self initMinkasu2FA];
    NSURL *nsurl=[NSURL URLWithString:@"https://dev.minkasupay.com/demo/Welcome_to_Net.html?minkasu2FA=true"];
    //    NSURL *nsurl=[NSURL URLWithString:@"http://192.168.1.145:8000/demo/Welcome_to_Net.html?minkasu2FA=true"];
    //    NSURL *nsurl=[NSURL URLWithString:@"http://192.168.1.198:8000/demo/Welcome_to_Net.html?minkasu2FA=true"];
    
    NSURLRequest *nsrequest=[NSURLRequest requestWithURL:nsurl];
    [_uiWebView loadRequest:nsrequest];
}
@end
