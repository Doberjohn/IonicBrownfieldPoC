//
//  ReactNativeBridgePlugin.h
//  App
//
//  Created by John Fanidis on 17/3/26.
//


#import <Cordova/CDVPlugin.h>

@interface ReactNativeBridgePlugin : CDVPlugin

- (void)openScreen:(CDVInvokedUrlCommand*)command;

@end