import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:mobihub_2/splash/splash.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
