# IonicBrownfieldPoC

Proof of Concept: React Native screen rendered inside an Ionic (Angular + Capacitor) iOS app using the Brownfield methodology.

## Structure

```
IonicBrownfieldPoC/
  rn-module/       # React Native (Expo) project, packaged as XCFramework
  ionic-app/       # Ionic + Angular + Capacitor app that consumes the XCFramework
```

## How It Works

1. The **rn-module** is a standalone Expo project that contains React Native screens. It uses `@callstack/react-native-brownfield` to package itself into an XCFramework artifact.
2. The **ionic-app** is an Ionic + Angular + Capacitor app. The XCFramework is linked into its Xcode project.
3. A lightweight **custom Capacitor plugin** bridges the Angular WebView layer to the native Swift layer, which uses the brownfield library API to present React Native screens.

## Tech Stack

| Component | Technology |
|-----------|-----------|
| RN Module | Expo SDK 54, react-native-brownfield v3.3 |
| Ionic App | Ionic 7+, Angular, Capacitor |
| Native Bridge | Custom Capacitor plugin (Swift) |
| JS Engine | Hermes |
| Platform | iOS |
