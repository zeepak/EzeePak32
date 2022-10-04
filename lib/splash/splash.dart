



import 'package:flutter/material.dart';



import 'firebase_splash.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  SplashServices splashScreen = SplashServices();
    @override
      void initState() {
   
    super.initState();
    splashScreen.isLogin(context);
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