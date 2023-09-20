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
    apiKey: 'AIzaSyBt82SUiz4pqEewMAZrzjRc838gJ8Nm-NY',
    appId: '1:148701989229:web:3b990b8ebfef3b2e993264',
    messagingSenderId: '148701989229',
    projectId: 'project1-9800f',
    authDomain: 'project1-9800f.firebaseapp.com',
    storageBucket: 'project1-9800f.appspot.com',
    measurementId: 'G-WXTT6T994R',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAMHk1tWkh2TCNMm8ne18Eu_QgS6_c0c_8',
    appId: '1:148701989229:android:10f27d998f33c9a8993264',
    messagingSenderId: '148701989229',
    projectId: 'project1-9800f',
    storageBucket: 'project1-9800f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAlbqFx7ElFQraXZrbq6l0QImoTGqYg5J4',
    appId: '1:148701989229:ios:450c9cace029fd90993264',
    messagingSenderId: '148701989229',
    projectId: 'project1-9800f',
    storageBucket: 'project1-9800f.appspot.com',
    iosClientId: '148701989229-l6rdr9p2bkltmicsj0den9v6o2c13rqk.apps.googleusercontent.com',
    iosBundleId: 'com.example.age',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAlbqFx7ElFQraXZrbq6l0QImoTGqYg5J4',
    appId: '1:148701989229:ios:450c9cace029fd90993264',
    messagingSenderId: '148701989229',
    projectId: 'project1-9800f',
    storageBucket: 'project1-9800f.appspot.com',
    iosClientId: '148701989229-l6rdr9p2bkltmicsj0den9v6o2c13rqk.apps.googleusercontent.com',
    iosBundleId: 'com.example.age',
  );
}
