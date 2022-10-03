

import 'dart:async';

import 'package:flutter/material.dart';

import '../Screens/home_page.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
   @override
  void initState() {

    super.initState();
    Timer(const Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    const Home()
            )
        )
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    body:  Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
         color: Colors.white
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: <Widget>[
                Image.asset(
                  "assets/images/img3.gif",
                  height: 250.0,
                  width: 250.0,
                ),
                
              ],
            ),

           
          ],
        ),
      ),
    );
  }
}