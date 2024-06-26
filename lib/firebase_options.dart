// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyDVvCYnsLv6wvW3jvK9a7IceQ1ygcUX2uA',
    appId: '1:618695047166:web:7f327f993e47100c1af2af',
    messagingSenderId: '618695047166',
    projectId: 'app0326',
    authDomain: 'app0326.firebaseapp.com',
    storageBucket: 'app0326.appspot.com',
    measurementId: 'G-29LRND1BHQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCvHpXFrJjU3sFNqMjtJMmrxs6o8Gnp7ew',
    appId: '1:618695047166:android:6d1961c5f67fabe41af2af',
    messagingSenderId: '618695047166',
    projectId: 'app0326',
    storageBucket: 'app0326.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAPSOYocbwdQLM2bxezOXwDa2iVbgIrPBs',
    appId: '1:618695047166:ios:b8667a20c13057a01af2af',
    messagingSenderId: '618695047166',
    projectId: 'app0326',
    storageBucket: 'app0326.appspot.com',
    iosBundleId: 'com.example.googlehomepage',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAPSOYocbwdQLM2bxezOXwDa2iVbgIrPBs',
    appId: '1:618695047166:ios:9c17f15ffcce3a211af2af',
    messagingSenderId: '618695047166',
    projectId: 'app0326',
    storageBucket: 'app0326.appspot.com',
    iosBundleId: 'com.example.googlehomepage.RunnerTests',
  );
}
