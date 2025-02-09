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
    apiKey: 'AIzaSyA6fNVW9HPZvVDz3K5rx1oYyN7zO4mm9W0',
    appId: '1:37061552960:web:31d6ece434ed2467b368a5',
    messagingSenderId: '37061552960',
    projectId: 'dnd-companion-a036d',
    authDomain: 'dnd-companion-a036d.firebaseapp.com',
    storageBucket: 'dnd-companion-a036d.firebasestorage.app',
    measurementId: 'G-GCGFJWDECD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCDRUGvdiENnQTfoh03PyN_xT2-60Aot0g',
    appId: '1:37061552960:android:459c17992d1d5df1b368a5',
    messagingSenderId: '37061552960',
    projectId: 'dnd-companion-a036d',
    storageBucket: 'dnd-companion-a036d.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA8odYtrzv4JquzJeiysQjtERkie88Oa8M',
    appId: '1:37061552960:ios:b6ac72c2cb7a461fb368a5',
    messagingSenderId: '37061552960',
    projectId: 'dnd-companion-a036d',
    storageBucket: 'dnd-companion-a036d.firebasestorage.app',
    iosBundleId: 'com.example.dziala',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA8odYtrzv4JquzJeiysQjtERkie88Oa8M',
    appId: '1:37061552960:ios:b6ac72c2cb7a461fb368a5',
    messagingSenderId: '37061552960',
    projectId: 'dnd-companion-a036d',
    storageBucket: 'dnd-companion-a036d.firebasestorage.app',
    iosBundleId: 'com.example.dziala',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA6fNVW9HPZvVDz3K5rx1oYyN7zO4mm9W0',
    appId: '1:37061552960:web:af14986a8c4b27ddb368a5',
    messagingSenderId: '37061552960',
    projectId: 'dnd-companion-a036d',
    authDomain: 'dnd-companion-a036d.firebaseapp.com',
    storageBucket: 'dnd-companion-a036d.firebasestorage.app',
    measurementId: 'G-GHY2DTTMBT',
  );
}
