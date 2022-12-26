import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobihub_2/Screens/email_verifcation_screen.dart';
import 'package:mobihub_2/Screens/navigationscreens.dart/phone_update_otp.dart';
import 'package:mobihub_2/Screens/search_screens/search_filter.dart';

import '../../Models/user_model.dart';
import '../home_page.dart';

class ProfileDetailScreen extends StatefulWidget {
  final String? name;
  final String? location;
  final String? phone;
  final String? email;

  const ProfileDetailScreen(
      {Key? key,
      required this.name,
      this.location,
      required this.phone,
      required this.email})
      : super(key: key);

  @override
  State<ProfileDetailScreen> createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
  final _auth = FirebaseAuth.instance;
  var collectionRef = FirebaseFirestore.instance.collection('UsersDetails');
  var dropDownValue;
  bool loading = false;
  var name = TextEditingController();
  var emailC = TextEditingController();
  var passwordC = TextEditingController();
  var city = TextEditingController();
  String? changePhoneNumber = '';
  var changeNumberController = TextEditingController();

  //String? email='';
  //String? fullName='';
  //String phone='';
  //String? location='';
  String gender = '';
  String? uid;

  _getDataFromDatabase() async {
    await FirebaseFirestore.instance
        .collection("UsersDetails")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get(GetOptions(source: Source.cache))
        .then((snapshot) async {
      if (snapshot.exists &&
          snapshot.get('email') != null &&
          snapshot.get('gender') != null &&
          snapshot.get('phone') != null) {
        setState(() {
          // phone = snapshot.data()!['phone'];
          gender = snapshot.data()!['gender'];
        });
      } else {
        setState(() {
          //phone = snapshot.data()!['phone'];
          gender = snapshot.data()!['gender'];
        });
      }
    });
  }

  @override
  void initState() {
    if (widget.location != null && widget.location!.isNotEmpty) {
      city = TextEditingController(text: widget.location);
    }
    debugPrint('Name is == ${widget.name}');

    if (widget.name != null && widget.name!.isNotEmpty) {
      name = TextEditingController(text: widget.name);
    }
    _getDataFromDatabase();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        foregroundColor: Colors.blueGrey,
        title: Text('Profile'),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    name = TextEditingController(text: (value));
                  });
                },
                initialValue: name.text=='null'?FirebaseAuth.instance.currentUser!.uid:name.text,
                decoration: InputDecoration(
                  hintText: 'Name',
                  prefixIcon: Icon(Icons.person_outline_outlined),
                  suffixIcon: Icon(Icons.edit_outlined),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              widget.email!.isEmpty || widget.email == 'null'
                  ? Visibility(
                      visible: false,
                      child: TextFormField(
                        readOnly: true,
                        initialValue: widget.email,
                        // onChanged: (value) {
                        //   setState(() {
                        //     email = value;
                        //   });
                        // },
                        decoration: InputDecoration(
                          hintText: 'Email',
                          prefixIcon: Icon(Icons.email_outlined),
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.edit_outlined),
                          ),
                        ),
                      ))
                  : TextFormField(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text('Want to change your email?'),
                                actions: [
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          controller: emailC,
                                          decoration: InputDecoration(
                                            hintText: 'new email',
                                            prefixIcon:
                                                Icon(Icons.email_outlined),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          controller: passwordC,
                                          decoration: InputDecoration(
                                            hintText: 'old Password',
                                            prefixIcon:
                                                Icon(Icons.lock_open_outlined),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        ElevatedButton(
                                            onPressed: () async {
                                              loading = true;

                                              await changeEmail(
                                                  email: emailC.text,
                                                  password: passwordC.text);

                                              loading = false;
                                            },
                                            child: loading
                                                ? Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: Colors.black,
                                                    ),
                                                  )
                                                : Text('Submit'))
                                      ],
                                    ),
                                  )
                                ],
                              );
                            });
                      },
                      readOnly: true,
                      initialValue: widget.email.toString(),
                      // onChanged: (value) {
                      //   setState(() {
                      //     email = value;
                      //   });
                      // },
                      decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.email_outlined),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.edit_outlined),
                        ),
                      ),
                    ),
              SizedBox(height: 20,),

              widget.phone!.isEmpty || widget.phone == 'null'
                  ? Visibility(
                      visible: false,
                      child: TextFormField(
                        readOnly: true,
                        initialValue: widget.phone.toString(),
                        decoration: InputDecoration(
                          hintText: 'Phone number',
                          prefixIcon: const Icon(Icons.phone_android),
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.edit_outlined),
                          ),
                        ),
                      ))
                  : TextFormField(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('want to change your number'),
                                actions: [
                                  TextFormField(
                                    controller: changeNumberController,
                                    decoration: InputDecoration(
                                      hintText: 'Type number',
                                      prefixIcon: Icon(Icons.phone_android),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        FirebaseAuth.instance.verifyPhoneNumber(
                                            phoneNumber:
                                                changeNumberController.text,
                                            timeout: const Duration(minutes: 2),
                                            verificationCompleted:
                                                (credential) async {
                                              await (FirebaseAuth
                                                      .instance.currentUser!)
                                                  .updatePhoneNumber(
                                                      credential);
                                              // either this occurs or the user needs to manually enter the SMS code
                                            },
                                            verificationFailed:
                                                (FirebaseAuthException e) {
                                              setState(() {
                                                loading = false;
                                              });
                                              if (e.code ==
                                                  'invalid-phone-number') {
                                                Fluttertoast.showToast(
                                                    msg:
                                                        'Invalid Phone Number');
                                              }
                                              if (e.code ==
                                                  'too-many-requests') {
                                                Fluttertoast.showToast(
                                                    msg: 'To many request');
                                              }
                                            },
                                            codeSent: (String verificationId,
                                                int? token) async {
                                              Fluttertoast.showToast(
                                                  msg: "Code send");
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (_) =>
                                                      PhoneUpdateOtpScreen(
                                                    verificationId:
                                                        verificationId,
                                                    phone:
                                                        changeNumberController
                                                            .text,
                                                    number:
                                                        changeNumberController
                                                            .text,
                                                  ),
                                                ),
                                              );

                                              setState(() {
                                                loading = false;
                                              });
                                            },
                                            codeAutoRetrievalTimeout: (e) {
                                              setState(() {
                                                loading = false;
                                              });
                                              Fluttertoast.showToast(msg: e);
                                            });
                                      },
                                      child: loading == true
                                          ? Center(
                                              child: SizedBox(
                                                  height: 20,
                                                  width: 20,
                                                  child:
                                                      CircularProgressIndicator()))
                                          : const Text('Update')),
                                ],
                              );
                            });
                      },
                      readOnly: true,
                      initialValue: widget.phone.toString(),
                      decoration: InputDecoration(
                        hintText: 'Phone number',
                        prefixIcon: const Icon(Icons.phone_android),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.edit_outlined),
                        ),
                      ),
                    ), //Phone TextField
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onTap: () {
                  setState(() async {
                    city.text = await Navigator.push(context,
                        MaterialPageRoute(builder: (_) => SearchScreen()));
                  });
                },
                readOnly: true,
                controller: city,
                decoration: InputDecoration(
                  hintText: 'Address',
                  prefixIcon: Icon(Icons.location_city_outlined),
                  suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_drop_down_circle_outlined)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                  ),
                ),
                hint: Text(gender.isNotEmpty ? gender : 'Select Gender'),
                items: ['Male', 'Female'].map(
                  (val) {
                    return DropdownMenuItem<String>(
                      value: val,
                      child: Text(val),
                    );
                  },
                ).toList(),
                onChanged: (String? val) {
                  setState(
                    () {
                      dropDownValue = val;
                    },
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(onPressed: () {}, child: Text('Cancel')),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.amberAccent),
                      onPressed: () async {
                        setState(() {
                          loading = true;
                        });
                        await postDetailsToFirestore();
                        setState(() {
                          loading = false;
                        });
                      },
                      child: loading
                          ? Center(
                              child: SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator()))
                          : Text('Save')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> changeEmail(
      {required String email, required String password}) async {
    //showLoadingDialog(message: AppTexts.updating);
    try {
      User user = _auth.currentUser!;
      DocumentReference ref = collectionRef.doc(user.uid);
      final cred = EmailAuthProvider.credential(
          email: user.email!, password: passwordC.text);
      user.reauthenticateWithCredential(cred).then((value) {
        user.updateEmail(email).then((_) async {
          await ref.update({'email': email}).then((value) async {
            // go to root page
            await _auth.currentUser!.sendEmailVerification();
            Fluttertoast.showToast(
                msg: 'Verification Email has been sent to you');
            await _auth.signOut();
          });
          setState(() {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => VerificationScreen()),
                (route) => false);
          });
        }).catchError((error) {
          Fluttertoast.showToast(msg: error.toString());
        });
      }).catchError((err) {
        Fluttertoast.showToast(msg: err.toString());
      });
    } on Exception catch (err) {
      Fluttertoast.showToast(msg: err.toString());

      // showErrorDialog(err.toString());
    }
  }

  postDetailsToFirestore() async {
    var auth = FirebaseAuth.instance;
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.fullName = name.text;
    userModel.phone = user.phoneNumber;
    userModel.location = city.text;
    userModel.joindate = '';
    userModel.gender = dropDownValue;

    await firebaseFirestore
        .collection("UsersDetails")
        .doc(user.uid)
        .update(userModel.toMap());
    Fluttertoast.showToast(msg: "Account Updated successfully :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => const Home()),
        (route) => false);
  }
}
