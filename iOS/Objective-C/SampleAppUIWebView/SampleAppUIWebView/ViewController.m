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

//****START Minkasu2FA Code***************
- (void) initMinkasu2FA{
    //initialize Customer object
    Minkasu2FACustomerInfo *customer = [Minkasu2FACustomerInfo new];
    customer.firstName = @"TestCustomer";
    customer.lastName = @"TestLastName";
    customer.email = @"test@minkasupay.com";
    customer.phone = @"+919876543210";
    
    Minkasu2FAAddress *address = [Minkasu2FAAddress new];
    address.line1 = @"123 Test way";
    address.line2 = @"Test Soc";
    address.city = @"Mumbai";
    address.state = @"Maharashtra";
    address.country= @"India";
    address.zipCode = @"400068";
    customer.address = address;
    
    //Create the Config object with merchant_id, merchant_access_token, merchant_customer_id and customer object.
    //merchant_customer_id is a unique id associated with the currently logged in user.
    Minkasu2FAConfig *config = [Minkasu2FAConfig new];
    config.merchantId = <merchant_id>";
    config.merchantToken = <merchant_access_token>;
    config.merchantCustomerId =<merchant_customer_id>;
    //add customer to the Config object
    config.customerInfo = customer;
    
    Minkasu2FAOrderInfo *orderInfo = [Minkasu2FAOrderInfo new];
    orderInfo.orderId = <order_id>;
    config.orderInfo = orderInfo;
    
    //Use this to set custom color theme
    Minkasu2FACustomTheme *mkcolorTheme = [Minkasu2FACustomTheme new];
    mkcolorTheme.navigationBarColor = UIColor.blueColor;
    mkcolorTheme.navigationBarTextColor = UIColor.whiteColor;
    mkcolorTheme.buttonBackgroundColor = UIColor.blueColor;
    mkcolorTheme.buttonTextColor = UIColor.whiteColor;
    config.customTheme = mkcolorTheme;
    //set the color theme to nil if you want use the minkasu2fa default color scheme
    //config.mk2faColorTheme = nil;
    
    //set sdkmode to SANDBOX_MODE if testing on sandbox
    //config.sdkmode = SANDBOX_MODE;
    
    _minkasu2fa = [[Minkasu2FA alloc] init];
    
    //Initializing UIWebView
    [Minkasu2FA initWithUIWebView:_uiWebView andConfiguration:config];
    [self.view addSubview:_uiWebView];
}
//****END Minkasu2FA Code***************

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    //Return YES or NO based on wether the request is a Minkasu 2FA Bridge Function
    return ![Minkasu2FA request:request shouldHandleByMinkasu2FAInWebView:webView navigationType:navigationType];
}

- (IBAction)clickNetBanking:(id)sender {
    [self initMinkasu2FA];
    NSURL *nsurl=[NSURL URLWithString:@"https://transactions.minkasupay.com/demo/Bank_Internet_Banking_login.htm"];
    NSURLRequest *nsrequest=[NSURLRequest requestWithURL:nsurl];
    [_uiWebView loadRequest:nsrequest];
}

- (IBAction)clickCreditDebit:(id)sender {
    [self initMinkasu2FA];
    NSURL *nsurl=[NSURL URLWithString:@"https://transactions.minkasupay.com/demo/Welcome_to_Net.html?minkasu2FA=true"];
    NSURLRequest *nsrequest=[NSURLRequest requestWithURL:nsurl];
    [_uiWebView loadRequest:nsrequest];
}
@end
