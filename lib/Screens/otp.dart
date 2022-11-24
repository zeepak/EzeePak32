import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobihub_2/Screens/main_login.dart';
import 'package:pinput/pinput.dart';

import '../Models/user_model.dart';
import 'home_page.dart';

class MyVerify extends StatefulWidget {
  final String verificationId;
  final String phone;
  final String number;

  const MyVerify({Key? key, required this.verificationId, required this.phone,required this.number})
      : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<MyVerify> createState() => _MyVerifyState(phone);
}

class _MyVerifyState extends State<MyVerify> {
  int secondsRemaining = 30;
  bool enableResend = false;
  Timer? timer;

  @override
  initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
  }
  void _resendCode() {
    //other code here
    setState((){
      secondsRemaining = 60;
      enableResend = false;
    });
  }

  @override
  dispose(){
    timer!.cancel();
    super.dispose();
  }

  bool loading = false;
  int resendToken = 0;
  String _verificationId = "";
  int? _resendToken;

  Future<bool> sendOTP({required String phone}) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) async {
        _verificationId = verificationId;
        _resendToken = resendToken;
      },
      timeout: const Duration(seconds: 25),
      forceResendingToken: _resendToken,
      codeAutoRetrievalTimeout: (String verificationId) {
        verificationId = _verificationId;
      },
    );
    debugPrint("_verificationId: $_verificationId");
    return true;
  }

  final String phone;

  _MyVerifyState(this.phone);

  bool validate = false;
  bool seconds = false;
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
                    onPressed: () async {
                      setState(() {
                        loading = true;
                      });
                      final crendital = PhoneAuthProvider.credential(
                          verificationId: widget.verificationId,
                          smsCode: _otpController.text);
                      try {
                        await _auth
                            .signInWithCredential(crendital);
                        setState(() {
                          loading=false;
                        });

                        Navigator.pushAndRemoveUntil(
                                (context),
                                MaterialPageRoute(builder: (context) => const Home()),
                                (route) => false);

                            Fluttertoast.showToast(msg: 'Login successfully');



                        // Navigator.pushAndRemoveUntil(
                        //     (context),
                        //     MaterialPageRoute(
                        //         builder: (context) => const Home()),
                        //     (route) => false);

                        // Fluttertoast.showToast(msg: 'Login successfully');
                      } catch (e) {
                        setState(() {
                          loading = false;
                        });
                        if (e == 'invalid-otp') {
                          Fluttertoast.showToast(msg: 'Invalid OTP');
                        }
                        //Fluttertoast.showToast(msg: '$e');
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
                                builder: (context) =>  MainLogin()));
                      },
                      child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Row(

                          children: [
                             Text(
                              widget.number,
                              style:
                                  TextStyle(color: Colors.black, fontFamily: 'Lato'),
                            ),
                            SizedBox(width: 4,),
                            Icon(Icons.edit_outlined,color: Colors.black87,size: 18,),
                          ],
                        ),
                      )),
                  secondsRemaining > 0
                      ? TextButton(
                          onPressed: () {},
                          child: Text(
                            "$secondsRemaining",
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'Lato'),
                          ),
                        )
                      : TextButton(
                          onPressed: () {

                            sendOTP(phone: widget.phone);
                            _resendCode();

                          },
                          child: Text(

                            "Resend",
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'Lato'),
                          ),
                        ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // postDetailsToFirestore() async {
  //   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //   User? user = _auth.currentUser;
  //
  //   UserModel userModel = UserModel();
  //
  //   // writing all the values
  //
  //   userModel.uid = user?.uid;
  //   userModel.phone = phone;
  //
  //   await firebaseFirestore
  //       .collection("UsersDetails")
  //       .doc(user?.uid)
  //       .set(userModel.toMap());
  //
  //   Navigator.pushAndRemoveUntil(
  //       (context),
  //       MaterialPageRoute(builder: (context) => const Home()),
  //       (route) => false);
  //
  //   Fluttertoast.showToast(msg: 'Login successfully');
  // }
}
