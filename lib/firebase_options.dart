// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAUKie_geQYE1au6qgbwfj822e5omxzVoo',
    appId: '1:117717744228:web:7995ea18f475e3d052bd71',
    messagingSenderId: '117717744228',
    projectId: 'lookup-9dc2c',
    authDomain: 'lookup-9dc2c.firebaseapp.com',
    storageBucket: 'lookup-9dc2c.appspot.com',
    measurementId: 'G-2YCRZN8ZZK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA_N9Nl1iIqOKR4b6EWxAd5Hs9RgXIsT80',
    appId: '1:117717744228:android:83fd478a4d38856752bd71',
    messagingSenderId: '117717744228',
    projectId: 'lookup-9dc2c',
    storageBucket: 'lookup-9dc2c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCV8Z0rZdTCtXeqRgo8tKnyfFnZloKIBA4',
    appId: '1:117717744228:ios:fe3ff9e7b536d3ac52bd71',
    messagingSenderId: '117717744228',
    projectId: 'lookup-9dc2c',
    storageBucket: 'lookup-9dc2c.appspot.com',
    iosClientId: '117717744228-mnqpf31nqj0lqkr6i9m97av0641nue7o.apps.googleusercontent.com',
    iosBundleId: 'com.lookup.lookup',
  );
}
