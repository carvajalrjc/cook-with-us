import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAwM0bh-zhXcIIp6Vqj18qc8aleABSgW_w",
            authDomain: "cook-with-us-4m96hs.firebaseapp.com",
            projectId: "cook-with-us-4m96hs",
            storageBucket: "cook-with-us-4m96hs.firebasestorage.app",
            messagingSenderId: "947969703614",
            appId: "1:947969703614:web:b6789e9f067c358b1468ef"));
  } else {
    await Firebase.initializeApp();
  }
}
