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
    
    //Initializing WKWebView
    [Minkasu2FA initWithWKWebView:_wkWebView andConfiguration:config];
    [self.view addSubview:_wkWebView];
}
//****END Minkasu2FA Code***************


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
