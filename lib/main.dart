import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobihub_2/binding/init_binding.dart';

import 'package:mobihub_2/splash/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp();


  
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
     initialBinding: InitBinding(),
     theme: ThemeData(
       primarySwatch: Colors.grey
        
      ),
      home: const Splash(),
    );
  }
}

