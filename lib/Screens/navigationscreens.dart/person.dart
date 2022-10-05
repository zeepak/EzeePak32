import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:mobihub_2/Screens/main_login.dart';




class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            const Text('My Profile',style: TextStyle(fontFamily: 'Lato',fontSize: 20),),
            const SizedBox(height: 5,),
            const Text('Sign in to start selling or buying vehicles',style: TextStyle(fontFamily: 'Lato1'),),
            const SizedBox(height: 20,),
            
           const SizedBox(height: 40,),
               Center(
                child: TextButton(
                  onPressed: ()async{
                     await FirebaseAuth.instance.signOut();
              //userEmail = "";
              await GoogleSignIn().signOut();
              setState(() {
               Navigator.push(context, MaterialPageRoute(builder: (context) => const MainLogin()));
              });
                  },
                   child: const Text('Logout')
                  ),
               )
          ],
        ),
      ),
    )
    );
  }
}