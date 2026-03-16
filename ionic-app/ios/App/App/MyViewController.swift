//
//  MyViewController.swift
//  App
//
//  Created by John Fanidis on 16/3/26.
//


import UIKit
import Capacitor

class MyViewController: CAPBridgeViewController {
    override open func capacitorDidLoad() {
        bridge?.registerPluginInstance(ReactNativeBridgePlugin())
    }
}