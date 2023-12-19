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
    apiKey: 'AIzaSyCbRNipgN5pxgHAim3hCkiZEygHF5ojxA8',
    appId: '1:53219700701:web:1dd02af8d996cc69199034',
    messagingSenderId: '53219700701',
    projectId: 'englishtuki',
    authDomain: 'englishtuki.firebaseapp.com',
    storageBucket: 'englishtuki.appspot.com',
    measurementId: 'G-JQRBFCNVS1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCEnJN9spkfreUO-58A7ESkmBVGonee8Jo',
    appId: '1:53219700701:android:af369edd6d55eda4199034',
    messagingSenderId: '53219700701',
    projectId: 'englishtuki',
    storageBucket: 'englishtuki.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBRoPU_hWjzo9i_hyBjqm4lJ3YNPy_cHq0',
    appId: '1:53219700701:ios:2dd88411bc516804199034',
    messagingSenderId: '53219700701',
    projectId: 'englishtuki',
    storageBucket: 'englishtuki.appspot.com',
    iosBundleId: 'com.example.englishTuki',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBRoPU_hWjzo9i_hyBjqm4lJ3YNPy_cHq0',
    appId: '1:53219700701:ios:d0974872ab40e243199034',
    messagingSenderId: '53219700701',
    projectId: 'englishtuki',
    storageBucket: 'englishtuki.appspot.com',
    iosBundleId: 'com.example.englishTuki.RunnerTests',
  );
}