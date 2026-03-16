//
//  ReactNativeBridgePlugin.swift
//  App
//
//  Created by John Fanidis on 16/3/26.
//


import Capacitor
import ReactBrownfield
import BrownfieldLib

@objc(ReactNativeBridgePlugin)
public class ReactNativeBridgePlugin: CAPPlugin, CAPBridgedPlugin {
    public let identifier = "ReactNativeBridgePlugin"
    public let jsName = "ReactNativeBridge"
    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "openScreen", returnType: CAPPluginReturnPromise)
    ]

    @objc func openScreen(_ call: CAPPluginCall) {
        let moduleName = call.getString("moduleName") ?? "main"

        DispatchQueue.main.async {
            guard let rnView = ReactNativeBrownfield.shared.view(
                moduleName: moduleName,
                initialProps: nil
            ) else {
                call.reject("Failed to create React Native view")
                return
            }

            let vc = UIViewController()
            vc.view = rnView
            vc.modalPresentationStyle = .fullScreen
            self.bridge?.viewController?.present(vc, animated: true)
        }

        call.resolve()
    }
}
