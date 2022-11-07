import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobihub_2/Firebase/forgot_password.dart';
import 'package:mobihub_2/Firebase/google.dart';
import 'package:mobihub_2/Screens/email_verifcation_screen.dart';
import 'package:mobihub_2/Screens/home_page.dart';
import 'package:mobihub_2/Screens/signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  // form key
  final _formKey = GlobalKey<FormState>();
//bool _isHidden = true;
  // editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool loading = false;
  // firebase
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;
  User? users;
  @override
  void initState() {
    setState(() {

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    //email field
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

    //password field
    final passwordField = TextFormField(
        cursorColor: Colors.black,
        controller: passwordController,
        obscureText: true,
        validator: (value) {
          RegExp regex = RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
          return null;
        },
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,

        decoration: const InputDecoration(


          hintText: 'Enter password',

          hintStyle: TextStyle(
            fontFamily: 'Lato1',
          ),
          label: Text(
            'Password',
            style: TextStyle(fontFamily: 'Lato', color: Colors.black),
//signIn(emailController.text, passwordController.text);
          ),

        ),
        );

    final loginButton = SizedBox(
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
          signIn(emailController.text, passwordController.text);
        },
        child: loading
            ? const CircularProgressIndicator(
                color: Colors.black,
              )
            : const Text(
                "Sign In",
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
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0,
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
                  'assets/icons/login1.svg',
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
                      'Sign in to EzeePak',
                      style: TextStyle(fontFamily: 'Lato', fontSize: 20),
                    ),
                    const SizedBox(height: 15),
                    emailField,
                    const SizedBox(height: 20),
                    passwordField,
                    const SizedBox(height: 35),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const ForgotPasswordScreen()));
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                            fontFamily: 'Lato',
                            color: Colors.black,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                    const SizedBox(height: 35),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(fontFamily: 'Lato1'),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Signup()));
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontFamily: 'Lato',
                                  color: Colors.black,
                                  decoration: TextDecoration.underline),
                            )),
                      ],
                    ),
                    const SizedBox(height: 30),
                    loginButton,
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
// void _togglePasswordView() {
//     setState(() {
//       _isHidden = !_isHidden;
//     });

// }
  // login function
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {




    try {
      setState(() {
        loading = true;
      });
        _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) =>
      {
        users=_auth.currentUser,

          if(users!.emailVerified)
            { setState(() {
              loading = false;
            }),
              Fluttertoast.showToast(msg: "Login Successful"),
              Navigator.pushAndRemoveUntil(
                  (context),
                  MaterialPageRoute(builder: (context) => const Home()),
                      (route) => false),
            }


        else{ setState(() {
        loading = false;
      }),
          Navigator.push(context, MaterialPageRoute(builder: (_)=>VerificationScreen()))

    }

      });

    }
    on FirebaseAuthException catch (error) {
      setState(() {
        loading = false;
      });
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address appears to be malformed.";

          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "operation-not-allowed":
          errorMessage =
          "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
      Fluttertoast.showToast(msg: errorMessage!);
    }

  //



    }
  }
   
}
