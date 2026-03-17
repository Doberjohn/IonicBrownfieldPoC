export const ReactNativeBridge = {
  openScreen(moduleName: string = 'main'): Promise<void> {
    return new Promise((resolve, reject) => {
      const cordova = (window as any).cordova;
      if (!cordova) {
        reject('cordova not found on window');
        return;
      }
      if (!cordova.exec) {
        reject('cordova.exec not found');
        return;
      }
      cordova.exec(
        () => resolve(),
        (err: any) => reject(err),
        'ReactNativeBridge',
        'openScreen',
        [moduleName]
      );
    });
  }
};
