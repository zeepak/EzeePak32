import 'package:flutter/material.dart';
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               SizedBox(
                height: 45,
                width: 300,
                 child: ElevatedButton(
                                    onPressed: () {
                                       Navigator.push(context, MaterialPageRoute(builder: (context) => const MainLogin()));
                                    },
                                    
                                    style: ButtonStyle(
                                      backgroundColor:  MaterialStateProperty.all(
                                              const Color(0xFFFFDC3D)),
                                              
                                         
                                          
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                            
                                        RoundedRectangleBorder(
                                          
                                            borderRadius: BorderRadius.circular(10),
                                            
                                            side: const BorderSide(
                                              color: Colors.transparent,
                                              width: 2,
                                            ),
                                            
                                            ),
                                            
                                      ),
                                    ),
                                    child: const Text(
                                            "Sign in oR Sign up",
                                            style: TextStyle(
                                              fontFamily: 'Lato1',
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                  ),

               ),
               
              ],
            ),
           const SizedBox(height: 40,),
               Center(
                child: TextButton(
                  onPressed: (){
                    
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