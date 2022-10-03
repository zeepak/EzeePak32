import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobihub_2/Screens/login_page.dart';
class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  bool validate = false;
  bool loading = false;
  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       extendBodyBehindAppBar: true,
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
                  'assets/icons/signup.svg',
                  height: 200,
                  width: 200,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Let's get you started!",
                style: TextStyle(fontFamily: 'Lato', fontSize: 20),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                 
                 cursorColor: Colors.black,
                decoration:  const InputDecoration(
                  
                    hintText: 'Enter Email',
                    hintStyle:  TextStyle(
                      fontFamily: 'Lato1',
                    ),
                    label: Text(
                      'Email Address',
                      style: TextStyle(fontFamily: 'Lato', color: Colors.black),
                    )),
                controller: _emailcontroller,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                 
                 cursorColor: Colors.black,
                decoration:  const InputDecoration(
                  
                    hintText: 'Enter Name',
                    hintStyle:  TextStyle(
                      fontFamily: 'Lato1',
                    ),
                    label: Text(
                      'Full Name',
                      style: TextStyle(fontFamily: 'Lato', color: Colors.black),
                    )),
                controller: _namecontroller,
                keyboardType: TextInputType.name,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (value) {
                  if (value.length == 8) {
                    setState(() {
                      validate = true;
                    });
                  }
                  if (value.length < 8) {
                    setState(() {
                      validate = false;
                    });
                  }
                },
                cursorColor: Colors.black,
                decoration:  InputDecoration(
                    hintText: 'Enter password',
                    hintStyle: const TextStyle(
                      fontFamily: 'Lato1',
                    ),
                    suffix: InkWell(
                      onTap: _togglePasswordView,
                      child: Icon(
                        _isHidden 
                        ? Icons.visibility 
                        : Icons.visibility_off,
                    ),
                      ),
                     
      
                    label: const Text(
                      'Password',
                      style: TextStyle(fontFamily: 'Lato', color: Colors.black),

                    ),
                    
                    ),
                controller: _passwordcontroller,
                maxLength: 8,
                obscureText: _isHidden,
              ),
               const SizedBox(
                height: 40,
              ),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
                      },
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                            fontFamily: 'Lato',
                            color: Colors.black,
                            decoration: TextDecoration.underline),
                      )),
                ],
              ),
              const SizedBox(
                height: 15,
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
                    onPressed: () {},
                    child: loading
                        ? const CircularProgressIndicator(
                            color: Colors.black,
                          )
                        : Text(
                            "Sign Up",
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
            ],
          ),
        ),
      ),
    );
  }
   void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
   
}
}