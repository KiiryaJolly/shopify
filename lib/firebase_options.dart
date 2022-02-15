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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCqkSwv4ct79RFDzU7Xl66SFPSASP5WXTA',
    appId: '1:755830745118:android:fd10335874149dd576660f',
    messagingSenderId: '755830745118',
    projectId: 'shopify-9c096',
    storageBucket: 'shopify-9c096.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCm98-7rfGGNdqxmZKu5NQ88kpUo-0Qc68',
    appId: '1:755830745118:ios:b00948adf600b5f276660f',
    messagingSenderId: '755830745118',
    projectId: 'shopify-9c096',
    storageBucket: 'shopify-9c096.appspot.com',
    iosClientId: '755830745118-at3ejmgun8ud94f308j1rnd6mi67mtc5.apps.googleusercontent.com',
    iosBundleId: 'shopify.ios.app',
  );
}
