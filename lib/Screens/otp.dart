import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
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

  const MyVerify({Key? key, required this.verificationId, required this.phone}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<MyVerify> createState() => _MyVerifyState(phone);
}

class _MyVerifyState extends State<MyVerify> {
  var auth =FirebaseAuth.instance;
  String Vid = '';
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
                    onPressed: () async {
                      setState(() {
                        loading = true;
                      });
                      final crendital = PhoneAuthProvider.credential(
                          verificationId: widget.verificationId,
                          smsCode: _otpController.text.toString());
                      try {
                        await _auth.signInWithCredential(crendital).then((value) => {postDetailsToFirestore()}).catchError((e){
                          Fluttertoast.showToast(msg: e!.message);
                        });

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
                                builder: (context) => const MainLogin()));
                      },
                      child: const Text(
                        "Edit Phone Number ?",
                        style:
                            TextStyle(color: Colors.black, fontFamily: 'Lato'),
                      )),
                  Container(
                      padding: const EdgeInsets.only(top: 5),
                      alignment: Alignment.topLeft,
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Code didn\'t send ?'
                          ),
                          TextSpan(
                              recognizer:  TapGestureRecognizer()
                                ..onTap = () {
                                  sendOTP(phone: widget.phone);
                                },
                              text: 'Resend',style: TextStyle(color: Colors.black87)
                          ),
                        ]),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    
    userModel.uid = user?.uid;
    userModel.phone = phone;
    userModel.email = user?.email;
    userModel.fullName = user?.displayName;
    userModel.location = '';
    userModel.joindate= '';
    userModel.gender= '';

    await firebaseFirestore
        .collection("UsersDetails")
        .doc(user?.uid)
        .set(userModel.toMap());
    
                        Navigator.pushAndRemoveUntil(
                            (context),
                            MaterialPageRoute(
                                builder: (context) => const Home()),
                            (route) => false);

                        Fluttertoast.showToast(msg: 'Login successfully');
  }
}
