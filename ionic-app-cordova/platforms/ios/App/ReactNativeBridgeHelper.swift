//
//  ReactNativeBridgeHelper.swift
//  App
//
//  Created by John Fanidis on 17/3/26.
//


import UIKit
import ReactBrownfield
import BrownfieldLib

@objc class ReactNativeBridgeHelper: NSObject {

    @objc static let shared = ReactNativeBridgeHelper()

    private var messageObserver: NSObjectProtocol?

    @objc func initializeReactNative() {
        ReactNativeBrownfield.shared.bundle = ReactNativeBundle
        ReactNativeBrownfield.shared.startReactNative()
        ReactNativeBrownfield.shared.ensureExpoModulesProvider()
        let _ = ReactNativeBrownfield.shared.application(
            UIApplication.shared, didFinishLaunchingWithOptions: nil
        )
    }

    @objc func presentReactNativeScreen(moduleName: String, from viewController: UIViewController) {
        let vc = ReactNativeViewController(moduleName: moduleName)
        vc.modalPresentationStyle = .fullScreen

        messageObserver = ReactNativeBrownfield.shared.onMessage { message in
            let cleaned = message.trimmingCharacters(in: CharacterSet(charactersIn: "\""))
            if cleaned == "dismiss" {
                DispatchQueue.main.async {
                    vc.dismiss(animated: true)
                }
            }
        }

        viewController.present(vc, animated: true)
    }
}