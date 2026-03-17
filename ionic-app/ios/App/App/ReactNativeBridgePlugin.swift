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

    private var messageObserver: NSObjectProtocol?

    @objc func openScreen(_ call: CAPPluginCall) {
        let moduleName = call.getString("moduleName") ?? "main"

        DispatchQueue.main.async {
            let vc = ReactNativeViewController(moduleName: moduleName)
            vc.modalPresentationStyle = .fullScreen

            // Listen for dismiss message from RN
            self.messageObserver = ReactNativeBrownfield.shared.onMessage { message in
                let cleaned = message.trimmingCharacters(in: CharacterSet(charactersIn: "\""))
                if cleaned == "dismiss" {
                    DispatchQueue.main.async {
                        vc.dismiss(animated: true)
                    }
                }
            }

            self.bridge?.viewController?.present(vc, animated: true)
        }

        call.resolve()
    }
}
