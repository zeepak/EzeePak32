import 'dart:async';


import 'package:flutter/material.dart';
import 'package:mobihub_2/Screens/home_page.dart';




class SplashServices {
  void isLogin(BuildContext context) {
   
      Timer(
          const Duration(seconds: 3),
          () => Navigator.pushAndRemoveUntil(
                      (context),
                      MaterialPageRoute(builder: (context) => const Home()),
                      (route) => false),
              );
   
  }
}
