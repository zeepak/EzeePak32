
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:mobihub_2/Screens/home_page.dart';
import 'package:mobihub_2/Screens/login_page.dart';
import 'package:mobihub_2/Screens/otp.dart';

import '../Firebase/google.dart';


class MainLogin extends StatefulWidget {
  const MainLogin({Key? key}) : super(key: key);

  @override
  State<MainLogin> createState() => _MainLoginState();
}

class _MainLoginState extends State<MainLogin> {
    bool loading = false;
   
    bool validate = false;

    
    final TextEditingController _phonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.black,
            ),
            onPressed: () {
             Navigator.pushAndRemoveUntil(
                      (context),
                      MaterialPageRoute(builder: (context) => const Home()),
                      (route) => false);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
         
          children: [
            const SizedBox(
              height: 15,
            ),
            const Center(
                child: Text('Welcome to MobiHub',
                    style: TextStyle(
                        color: Colors.black, fontSize: 18, fontFamily: 'Lato'))),
                        const SizedBox(height: 30,),
                        SvgPicture.asset('assets/icons/login.svg',height: 150,width: 150,),
                        const SizedBox(height: 35,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: TextField(
                            cursorColor: Colors.black,
                             onChanged: (value) {
                                    if (value.length == 10) {
                                      setState(() {
                                        validate = true;
                                      });
                                    }
                                    if (value.length < 10) {
                                      setState(() {
                                        validate = false;
                                      });
                                    }
                                  },
                  decoration: const InputDecoration(
                    hintText: 'Phone Number',
                    enabledBorder: UnderlineInputBorder(      
	  borderSide: BorderSide(color: Colors.grey),   
	  ),  
	  focusedBorder: UnderlineInputBorder(
	  borderSide: BorderSide(color: Colors.black),
	   ),  
                    prefix: Padding(
                      padding: EdgeInsets.all(4),
                      child: Text('+92'),
                    ),
                  ),
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                  controller: _phonecontroller,
                ),
                        ),
                        const SizedBox(height: 10,),
                         SizedBox(
                              height: 45,
                              width: 300,
                              child: AbsorbPointer(
                                absorbing: validate ? false : true,
                                child: ElevatedButton(
                                  onPressed: () {
                                     Navigator.push(context, MaterialPageRoute(builder: (context) => const MyVerify()));
                                  },
                                  
                                  style: ButtonStyle(
                                    backgroundColor: validate
                                        ? MaterialStateProperty.all(
                                            const Color(0xFFFFDC3D))
                                            
                                        : MaterialStateProperty.all(Colors.grey.shade400),
                                        
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                          
                                      RoundedRectangleBorder(
                                        
                                          borderRadius: BorderRadius.circular(10),
                                          
                                          side: const BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          
                                          ),
                                          
                                    ),
                                  ),
                                  child:  loading
                                      ? const CircularProgressIndicator(
                                          color: Colors.black,
                                        )
                                      : Text(
                                          "Continue...",
                                          style: TextStyle(
                                            fontFamily: 'Lato',
                                            color: validate? Colors.black: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                
                        const SizedBox(height: 50,),
               GestureDetector(
                onTap: () async {
                 await signInWithGoogle();
                 
              setState(() {
                //const Center(child: CircularProgressIndicator(color: Colors.blue,));
                Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => const Home()),
        (route) => false);
              });
              
                },
                 child: Container(
                 height: 45,
                 width: 300,
                           decoration:  BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.transparent,
                    width: 1
                  ),
                  boxShadow: const[
                    BoxShadow(
                      color: Colors.black38,
                       blurRadius: 5,
                    ),
                  ],
                 ),
                 child: Row(
                  children:  [
                    const SizedBox(width: 7,),
                    SvgPicture.asset('assets/icons/google.svg',height: 20,width: 20,),
                    
                    const SizedBox(width: 45,),
                    const Text('Continue with Google',style: TextStyle(fontSize: 16,fontFamily: 'Lato1'),),
                  ],
                 ),
                 ),
               ),       
               const SizedBox(height: 10,),
               GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
                },
                 child: Container(
                 height: 45,
                 width: 300,
                           decoration:  BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.transparent,
                    width: 1
                  ),
                   boxShadow: const[
                    BoxShadow(
                      color: Colors.black38,
                       blurRadius: 5,
                    ),
                  ],
                 ),
                 child: Row(
                  children:  [
                    const SizedBox(width: 7,),
                    SvgPicture.asset('assets/icons/email.svg',height: 20,width: 20,),
                    
                    const SizedBox(width: 45,),
                    const Text('Continue with Email',style: TextStyle(fontSize: 16,fontFamily: 'Lato1'),),
                  ],
                 ),
                 ),
               ),       
               const SizedBox(height: 10,),
               GestureDetector(
                
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
                },
                 child: Container(
                 height: 45,
                 width: 300,
                           decoration:  BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.transparent,
                    width: 1
                  ),
                   boxShadow: const[
                    BoxShadow(
                      color: Colors.black38,
                       blurRadius: 5,
                    ),
                  ],
                 ),
                 child: Row(
                  children: [
                    const SizedBox(width: 7,),
                    SvgPicture.asset('assets/icons/facebook.svg',height: 20,width: 20,),
                    
                    const SizedBox(width: 45,),
                    const Text('Continue with Facebook',style: TextStyle(fontSize: 16,fontFamily: 'Lato1'),),
                  ],
                 ),
                 ),
               ), 
               const SizedBox(height: 50,),
               const Text('By continuing you agree to our',style: TextStyle(fontFamily: 'Lato1'),),
               const SizedBox(height: 5,),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                 Text('Terms of use',style: TextStyle(fontFamily: 'Lato',decoration: TextDecoration.underline,),),
                 SizedBox(width: 4,),
                 Text('and',style: TextStyle(fontFamily: 'Lato1'),),
                 SizedBox(width: 4,),
                 Text('Privay Policy',style: TextStyle(fontFamily: 'Lato',decoration: TextDecoration.underline,),),
                ],
               ),      
          ],
        ),
      ),
    );
  }
   
}
