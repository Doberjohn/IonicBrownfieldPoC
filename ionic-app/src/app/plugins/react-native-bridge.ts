import { registerPlugin } from "@capacitor/core";

export interface ReactNativeBridgePlugin {
  openScreen(options: { moduleName: string }): Promise<void>;
}

export const ReactNativeBridge =
  registerPlugin<ReactNativeBridgePlugin>("ReactNativeBridge");
