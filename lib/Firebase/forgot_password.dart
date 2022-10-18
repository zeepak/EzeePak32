import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);
  

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();
  final auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
        cursorColor: Colors.black,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
            hintText: 'username@gmail.com',
            hintStyle: TextStyle(
              fontFamily: 'Lato1',
            ),
            label: Text(
              'Email',
              style: TextStyle(fontFamily: 'Lato', color: Colors.black),
            )));
    final forgotbutton = SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(const Color(0xFFFFDC3D)),
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
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            setState(() {
              loading = true;
            });
            auth
                .sendPasswordResetEmail(email: emailController.text.toString())
                .then((value) {
                  setState(() {
              loading = false;
            });
              Fluttertoast.showToast(
                  msg:
                      "We have sent you email to recover password, please check email"
                      
                      );
              //Utils().toastMessage('We have sent you email to recover password, please check email');
            }).onError((error, stackTrace) {
              setState(() {
                loading = false;
              });
              Fluttertoast.showToast(msg: errorMessage!);
              //Utils().toastMessage(error.toString());
            });
          }
        },
        child: loading
            ? const CircularProgressIndicator(
                color: Colors.black,
              )
            : const Text(
                "Forgot Password",
                style: TextStyle(
                  fontFamily: 'Lato',
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFDC3D),
        title: const Text(
          'Forgot Password',
          style: TextStyle(fontFamily: 'Lato', fontSize: 17),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              Center(
                child: SvgPicture.asset(
                  'assets/icons/Forgot.svg',
                  height: 200,
                  width: 200,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Forgot Your Password',
                      style: TextStyle(fontFamily: 'Lato', fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    emailField,
                    const SizedBox(
                      height: 40,
                    ),
                    forgotbutton,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
