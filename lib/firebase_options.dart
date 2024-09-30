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
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyDS-jdpYO36mB6N7cBqFVwfV4eJlp06jiU',
    appId: '1:218347256155:web:be7c6cd7621a1b578b427e',
    messagingSenderId: '218347256155',
    projectId: 'flutter-project-35f2c',
    authDomain: 'flutter-project-35f2c.firebaseapp.com',
    storageBucket: 'flutter-project-35f2c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyByxiha_6LDJmSHuWBwI1WOIanhp1SDkr0',
    appId: '1:218347256155:android:06097a1bfe9a39098b427e',
    messagingSenderId: '218347256155',
    projectId: 'flutter-project-35f2c',
    storageBucket: 'flutter-project-35f2c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDj_tg1aS9L_a2F-9I-D2p_jGZ3DeeF_qQ',
    appId: '1:218347256155:ios:b411cb797ee050088b427e',
    messagingSenderId: '218347256155',
    projectId: 'flutter-project-35f2c',
    storageBucket: 'flutter-project-35f2c.appspot.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDj_tg1aS9L_a2F-9I-D2p_jGZ3DeeF_qQ',
    appId: '1:218347256155:ios:b411cb797ee050088b427e',
    messagingSenderId: '218347256155',
    projectId: 'flutter-project-35f2c',
    storageBucket: 'flutter-project-35f2c.appspot.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDS-jdpYO36mB6N7cBqFVwfV4eJlp06jiU',
    appId: '1:218347256155:web:d268c98946d707938b427e',
    messagingSenderId: '218347256155',
    projectId: 'flutter-project-35f2c',
    authDomain: 'flutter-project-35f2c.firebaseapp.com',
    storageBucket: 'flutter-project-35f2c.appspot.com',
  );
}
