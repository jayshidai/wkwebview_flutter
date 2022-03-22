//
//  FLTWKUIDelegate.m
//  webview_flutter
//
//  Created by novice on 2022/3/19.
//

#import "FLTWKUIDelegate.h"

@implementation FLTWKUIDelegate
{
    FlutterMethodChannel *_methodChannel;
}
- (instancetype)initWithChannel:(FlutterMethodChannel *)channel {
  self = [super init];
  if (self) {
    _methodChannel = channel;
  }
  return self;
}

#pragma mark WKUIDelegate

- (WKWebView*)webView:(WKWebView*)webView
    createWebViewWithConfiguration:(WKWebViewConfiguration*)configuration
               forNavigationAction:(WKNavigationAction*)navigationAction
                    windowFeatures:(WKWindowFeatures*)windowFeatures {
  if (!navigationAction.targetFrame.isMainFrame) {
    [webView loadRequest:navigationAction.request];
  }

  return nil;
}

-(void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * _Nullable))completionHandler{
    NSLog(@"runJavaScriptTextInputPanelWithPrompt方法%s", __func__);
    NSLog(@"prompt:%@,",prompt);
    if (!prompt) {
        completionHandler(nil);
        return;
    }
    [_methodChannel invokeMethod:@"onGetBusinessMsg" arguments:prompt result:^(id  _Nullable result) {
        NSLog(@"来自flutter:%@,",result);
        //@"{data = {};stat = 1;}"
        completionHandler(result);
    }];
}

@end
