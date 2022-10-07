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
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            
              ElevatedButton(
                onPressed: (){},
                 style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 0,
                 ),
                 child:  const Text('Contect Us',style: TextStyle(color: Colors.black,fontFamily: 'Lato1',fontSize: 16),),
                 ),
                 
                  
               const SizedBox(height: 15,),
               ElevatedButton.icon(
                
                onPressed: ()async{
                  await FirebaseAuth.instance.signOut();
               //userEmail = "";
              await GoogleSignIn().signOut();
              setState(() {
              Navigator.pushAndRemoveUntil(
                  (context),
                  MaterialPageRoute(builder: (context) => const MainLogin()),
                  (route) => false);
              });
                }, 
                icon: const Icon(Icons.logout,color: Colors.red,size: 18,), 
                label: const Text('Logout',style: TextStyle(color: Colors.red,fontFamily: 'Lato1',fontSize: 16),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  
                ),
                ),
               
          ],
        ),
      ),
    )
    );
  }
}
// await FirebaseAuth.instance.signOut();
//               //userEmail = "";
//               await GoogleSignIn().signOut();
//               setState(() {
//                Navigator.push(context, MaterialPageRoute(builder: (context) => const MainLogin()));
//               });