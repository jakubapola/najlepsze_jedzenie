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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyByIXOEhiM-OmNN7Okw74CoCl7_qpdBg6A',
    appId: '1:784979417734:android:af1babfeb4a0ed752b4f07',
    messagingSenderId: '784979417734',
    projectId: 'najlepsze-jedzenie-654321',
    storageBucket: 'najlepsze-jedzenie-654321.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD3XdhEykOYOWSeK3tFIykD3t3pUCeFy1s',
    appId: '1:784979417734:ios:b1178cbf2be8f8c82b4f07',
    messagingSenderId: '784979417734',
    projectId: 'najlepsze-jedzenie-654321',
    storageBucket: 'najlepsze-jedzenie-654321.appspot.com',
    iosClientId: '784979417734-l5m8op1nnnnu9k9a2q2p2ofdlou76o1h.apps.googleusercontent.com',
    iosBundleId: 'com.jakubapola.najlepszeJedzenie',
  );
}
