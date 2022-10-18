import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:mobihub_2/splash/splash.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb){
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyCsOd4VsB12Spw_35uSFbVw5LeqYTKc9MA",
         appId: "1:820430476481:web:dae0f6acfcda2477a5f040",
          messagingSenderId: "820430476481",
           projectId: "ezeepak",
           storageBucket: "ezeepak.appspot.com",
           measurementId: "G-1KW1XN8NYZ",
           authDomain: "ezeepak.firebaseapp.com",
           )
    );
  }else{
    await Firebase.initializeApp();
  }
  
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
     theme: ThemeData(
       primarySwatch: Colors.grey
        
      ),
      home: const Splash(),
    );
  }
}
