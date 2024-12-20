// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDnNZKo97kwh8rbsvfv9QhZCcVbKVlcm4E',
    appId: '1:673036457604:web:215304d9851376c52f94d1',
    messagingSenderId: '673036457604',
    projectId: 'kabar-harian-c94f0',
    authDomain: 'kabar-harian-c94f0.firebaseapp.com',
    storageBucket: 'kabar-harian-c94f0.appspot.com',
    measurementId: 'G-HHH6TK4ST3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBvzy0Qg9k1D2VS_K80ZIDOiL0kbrL2hs0',
    appId: '1:673036457604:android:6255584292df03962f94d1',
    messagingSenderId: '673036457604',
    projectId: 'kabar-harian-c94f0',
    storageBucket: 'kabar-harian-c94f0.appspot.com',
  );
}
