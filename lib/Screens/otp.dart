import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobihub_2/Screens/main_login.dart';
import 'package:pinput/pinput.dart';

import 'home_page.dart';



class MyVerify extends StatefulWidget {
  final String verificationId;
  const MyVerify({Key? key, required this.verificationId}) : super(key: key);

  @override
  State<MyVerify> createState() => _MyVerifyState();
}

class _MyVerifyState extends State<MyVerify> {
  bool validate = false;
  bool loading = false;
  final _otpController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   icon: const Icon(
        //     Icons.arrow_back_ios_rounded,
        //     color: Colors.black,
        //   ),
        // ),
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/otp.svg',
                height: 200,
                width: 200,
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Phone Verification",
                style: TextStyle(fontSize: 22, fontFamily: 'Lato'),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Please enter your verification code",
                style: TextStyle(fontSize: 16, fontFamily: 'Lato1'),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              Pinput(
                length: 6,
                controller: _otpController,
                onChanged: (value) {
                  if (value.length == 6) {
                    setState(() {
                      validate = true;
                    });
                  }
                  if (value.length < 6) {
                    setState(() {
                      validate = false;
                    });
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: AbsorbPointer(
                  absorbing: validate ? false : true,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: validate
                          ? MaterialStateProperty.all(const Color(0xFFFFDC3D))
                          : MaterialStateProperty.all(Colors.grey.shade400),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                    onPressed: ()  async {
                      setState(() {
                        loading = true;
                      });
                      final crendital = PhoneAuthProvider.credential(
                  verificationId: widget.verificationId, 
                  smsCode: _otpController.text.toString()
              );
                try{
                
                await _auth.signInWithCredential(crendital);
                
                Navigator.pushAndRemoveUntil(
                  (context),
                  MaterialPageRoute(builder: (context) => const Home()),
                  (route) => false);

                Fluttertoast.showToast(msg: 'Login successfully');
              }catch(e){
                setState(() {
                  loading = false ;
                });
                
               Fluttertoast.showToast(msg: '$e');
              }
                    },
                    child: loading
                        ? const CircularProgressIndicator(
                            color: Colors.black,
                          )
                        : Text(
                            "Verify Code",
                            style: TextStyle(
                              fontFamily: 'Lato',
                              color: validate ? Colors.black : Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainLogin()));
                      },
                      child: const Text(
                        "Edit Phone Number ?",
                        style:
                            TextStyle(color: Colors.black, fontFamily: 'Lato'),
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainLogin()));
                      },
                      child: const Text(
                        "Resend()",
                        style:
                            TextStyle(color: Colors.black, fontFamily: 'Lato'),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
   
}
