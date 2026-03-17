import { Component } from '@angular/core';
import { IonHeader, IonToolbar, IonTitle, IonContent, IonButton } from '@ionic/angular/standalone';
import { ReactNativeBridge } from '../plugins/react-native-bridge';

@Component({
  selector: 'app-tab3',
  templateUrl: 'tab3.page.html',
  styleUrls: ['tab3.page.scss'],
  standalone: true,
  imports: [IonHeader, IonToolbar, IonTitle, IonContent, IonButton],
})
export class Tab3Page {
  async openReactNative() {
    try {
      console.log('Calling openScreen...');
      await ReactNativeBridge.openScreen('main');
      console.log('openScreen resolved');
    } catch (err) {
      console.error('openScreen error:', err);
      alert('Error: ' + JSON.stringify(err));
    }
  }
}
