#import "WkwebviewFlutterPlugin.h"
#import "FLTCookieManager.h"
#import "FlutterWebView.h"
@implementation WkwebviewFlutterPlugin
//+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
//  FlutterMethodChannel* channel = [FlutterMethodChannel
//      methodChannelWithName:@"wkwebview_flutter"
//            binaryMessenger:[registrar messenger]];
//  WkwebviewFlutterPlugin* instance = [[WkwebviewFlutterPlugin alloc] init];
//  [registrar addMethodCallDelegate:instance channel:channel];
//}
//
//- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
//  if ([@"getPlatformVersion" isEqualToString:call.method]) {
//    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
//  } else {
//    result(FlutterMethodNotImplemented);
//  }
//}
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FLTWebViewFactory* webviewFactory =
      [[FLTWebViewFactory alloc] initWithMessenger:registrar.messenger];
  [registrar registerViewFactory:webviewFactory withId:@"plugins.flutter.io/webview"];
  [FLTCookieManager registerWithRegistrar:registrar];
}
@end
