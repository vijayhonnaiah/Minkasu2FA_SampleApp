//
//  Minkasu2FA.h
//  Minkasu2FA
//
//  Created by Sachin Selvaraj on 6/19/18.
//  Copyright © 2018 minkasu. All rights reserved.
//

#import <WebKit/WebKit.h>
#import "Minkasu2FAJSBridge.h"
#import "Minkasu2FAConfig.h"

NS_ASSUME_NONNULL_BEGIN

@interface Minkasu2FA : NSObject

+ (void) initWithWKWebView: (WKWebView *)webView andConfiguration:(Minkasu2FAConfig *) config;
+ (void) initWithUIWebView: (UIWebView *)webView andConfiguration:(Minkasu2FAConfig *) config;
+ (BOOL) request:(NSURLRequest *)request  shouldHandleByMinkasu2FAInWebView:(UIWebView *)webView navigationType:(UIWebViewNavigationType)navigationType;
+ (void) registerMinkasu2FACustomUserAgent;
+ (NSString *) getMinkasu2faUserAgent: (NSString *)webViewType;

@end

NS_ASSUME_NONNULL_END
