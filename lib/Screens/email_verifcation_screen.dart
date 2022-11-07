import 'package:flutter/material.dart';
import 'package:mobihub_2/Screens/login_page.dart';
class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/email.png',height: 220,),
                SizedBox(height: 20,),
                Text("Email Verification",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,letterSpacing: 0.5),),
                SizedBox(height: 20,),
                Text("Verification email has been sent to you",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14.5,letterSpacing: 0.3),),
                SizedBox(height: 20,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,foregroundColor: Colors.white),
                      onPressed: (){
                    setState(() {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>Login()), (route) => false);
                    });
                  }, child: Text('Sign Out')),
                ),

              ],
            ),
          ),
        ),
      ),

    );
  }
}
