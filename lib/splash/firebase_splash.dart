import 'dart:async';


import 'package:flutter/material.dart';
import 'package:mobihub_2/Screens/home_page.dart';


class SplashServices {
  void isLogin(BuildContext context) {
    // final auth = FirebaseAuth.instance;
    // final user = auth.currentUser;
    //if (user != null) {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Home())));
   // } else {
      // Timer(
      //     const Duration(seconds: 3),
      //     () => Navigator.push(context,
      //         MaterialPageRoute(builder: (context) => const MainLogin())));
   // }
  }
}
