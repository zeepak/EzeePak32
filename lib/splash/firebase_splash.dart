import 'dart:async';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobihub_2/Screens/home_page.dart';
import 'package:mobihub_2/Screens/main_login.dart';




class SplashServices {
  void isLogin(BuildContext context) {
    FirebaseAuth? auth ;
    auth = FirebaseAuth.instance;
    User? users=auth.currentUser;
    if(users==null)
      {
        Timer(
          const Duration(seconds: 3),
              () => Navigator.pushAndRemoveUntil(
              (context),
              MaterialPageRoute(builder: (context) => const MainLogin()),
                  (route) => false),
        );
      }else{
      Timer(
          const Duration(seconds: 3),
          () => Navigator.pushAndRemoveUntil(
                      (context),
                      MaterialPageRoute(builder: (context) => const Home()),
                      (route) => false),
              );
   
  }}
}
