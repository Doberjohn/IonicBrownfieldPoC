//
//  ReactNativeBridgePlugin.m
//  App
//
//  Created by John Fanidis on 17/3/26.
//


#import "ReactNativeBridgePlugin.h"
#import "ionic_app_cordova-Swift.h"

@implementation ReactNativeBridgePlugin

- (void)pluginInitialize {
    [super pluginInitialize];
    NSLog(@">>> ReactNativeBridgePlugin pluginInitialize called");
    [[ReactNativeBridgeHelper shared] initializeReactNative];
}

- (void)openScreen:(CDVInvokedUrlCommand*)command {
    NSString* moduleName = [command.arguments objectAtIndex:0];
    if (!moduleName) {
        moduleName = @"main";
    }

    dispatch_async(dispatch_get_main_queue(), ^{
        [[ReactNativeBridgeHelper shared] presentReactNativeScreenWithModuleName:moduleName from:self.viewController];

        CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    });
}

@end
