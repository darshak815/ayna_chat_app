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
    apiKey: 'AIzaSyAbHSSpT2Xk5T5OST0UqangcP4RzwzseHU',
    appId: '1:328593412081:web:42531050240b39265fbe50',
    messagingSenderId: '328593412081',
    projectId: 'webdemo-84a74',
    authDomain: 'webdemo-84a74.firebaseapp.com',
    storageBucket: 'webdemo-84a74.appspot.com',
    measurementId: 'G-X6YY3H287Q',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAsB4mvIoMK5csuuwYWxTsPJpIjEHJvuU4',
    appId: '1:328593412081:android:8cd1c6b5b1d902805fbe50',
    messagingSenderId: '328593412081',
    projectId: 'webdemo-84a74',
    storageBucket: 'webdemo-84a74.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB3HoA-X917ygJ7KdWPf08jqnCuJyOzZOc',
    appId: '1:328593412081:ios:906d5c1fd6dfe5625fbe50',
    messagingSenderId: '328593412081',
    projectId: 'webdemo-84a74',
    storageBucket: 'webdemo-84a74.appspot.com',
    iosBundleId: 'com.app.aynaChatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB3HoA-X917ygJ7KdWPf08jqnCuJyOzZOc',
    appId: '1:328593412081:ios:906d5c1fd6dfe5625fbe50',
    messagingSenderId: '328593412081',
    projectId: 'webdemo-84a74',
    storageBucket: 'webdemo-84a74.appspot.com',
    iosBundleId: 'com.app.aynaChatApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAbHSSpT2Xk5T5OST0UqangcP4RzwzseHU',
    appId: '1:328593412081:web:bacfc5bb39c953815fbe50',
    messagingSenderId: '328593412081',
    projectId: 'webdemo-84a74',
    authDomain: 'webdemo-84a74.firebaseapp.com',
    storageBucket: 'webdemo-84a74.appspot.com',
    measurementId: 'G-EM881FHVC1',
  );
}