//
//  FLTWKUIDelegate.h
//  webview_flutter
//
//  Created by novice on 2022/3/19.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
#import <WebKit/WebKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface FLTWKUIDelegate : NSObject <WKUIDelegate>
- (instancetype)initWithChannel:(FlutterMethodChannel*)channel;
@end

NS_ASSUME_NONNULL_END
