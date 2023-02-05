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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDMIRqeljXIgotXyQLFcjhFD6VY_oh1__s',
    appId: '1:406066094827:web:32bd8f3aa6ad40009a94ae',
    messagingSenderId: '406066094827',
    projectId: 'class-work-ab760',
    authDomain: 'class-work-ab760.firebaseapp.com',
    storageBucket: 'class-work-ab760.appspot.com',
    measurementId: 'G-SK57C6X9B6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAW3fRO3biVmPy6Lyqce0dCt_Ak9s8nh4o',
    appId: '1:406066094827:android:7e87ce8e0a2af0df9a94ae',
    messagingSenderId: '406066094827',
    projectId: 'class-work-ab760',
    storageBucket: 'class-work-ab760.appspot.com',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB8TmLcCEQWLD4fl3HvnFczLIjVQCeco7s',
    appId: '1:406066094827:ios:6e9a729af06dfd3f9a94ae',
    messagingSenderId: '406066094827',
    projectId: 'class-work-ab760',
    storageBucket: 'class-work-ab760.appspot.com',
    iosClientId: '406066094827-uhnvkt0lpaoioqfkjq0fntctleqj5oaq.apps.googleusercontent.com',
    iosBundleId: 'com.example.project4',
  );
}
