import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobihub_2/Screens/email_verifcation_screen.dart';
import 'package:mobihub_2/Screens/search_screens/search_filter.dart';

import '../../Models/user_model.dart';
import '../home_page.dart';

class ProfileDetailScreen extends StatefulWidget {
  final String? name;
  final String? email;
  final String? location;
  final String? gender;
  final String? phone;


  const ProfileDetailScreen(
      {Key? key, required this.name, required this.email, this.location, required this.gender,  required this.phone})
      : super(key: key);

  @override
  State<ProfileDetailScreen> createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
  final _auth=FirebaseAuth.instance;
  var collectionRef = FirebaseFirestore.instance.collection('UsersDetails');
  var dropDownValue;
  bool loading = false;
  var name = TextEditingController();
  var emailC = TextEditingController();
  var passwordC =TextEditingController();
  var city = TextEditingController();


  @override
  void initState() {
    print(widget.email);
    if (widget.location != null && widget.location!.isNotEmpty) {
      setState(() {
        city = TextEditingController(text: widget.location);
      });
    }
    if (widget.name != null && widget.name!.isNotEmpty) {
      setState(() {
        name = TextEditingController(text: widget.name);
      });
    }
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
                initialValue: name.text,

                decoration: InputDecoration(
                  hintText: 'Name',
                  prefixIcon: Icon(Icons.person_outline_outlined),
                  suffixIcon: Icon(Icons.edit_outlined),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              widget.email == null?
                  Visibility(
                  visible: false,
                  child:  TextFormField(
                    onTap: (){
                      showDialog(context: context, builder: (context) {
                        return AlertDialog(
                          content: Text('Want to change your email?'),
                          actions: [
                            Padding(padding:EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller:emailC,
                                    decoration: InputDecoration(
                                      hintText: 'new email',
                                      prefixIcon: Icon(Icons.email_outlined),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  TextFormField(
                                    controller: passwordC,
                                    decoration: InputDecoration(
                                      hintText: 'old Password',
                                      prefixIcon: Icon(Icons.lock_open_outlined),
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  ElevatedButton(onPressed: ()async{

                                    loading=true;

                                    await changeEmail(
                                        email: emailC.text,password: passwordC.text
                                    );

                                    loading=false;



                                  }, child:loading?Center(child: CircularProgressIndicator(color:Colors.black,),):  Text('Submit'))
                                ],
                              ),
                            )
                          ],

                        );
                      }
                      );
                    },
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
                      suffixIcon: IconButton(onPressed: () {

                      }, icon: Icon(Icons.edit_outlined),),
                    ),
                  ))
              :TextFormField(
                onTap: (){
                  showDialog(context: context, builder: (context) {
                    return AlertDialog(
                      content: Text('Want to change your email?'),
                      actions: [
                        Padding(padding:EdgeInsets.all(10),
                          child: Column(
                            children: [
                              TextFormField(
                                controller:emailC,
                                decoration: InputDecoration(
                                  hintText: 'new email',
                                  prefixIcon: Icon(Icons.email_outlined),
                                ),
                              ),
                              SizedBox(height: 10,),
                              TextFormField(
                                controller: passwordC,
                                decoration: InputDecoration(
                                  hintText: 'old Password',
                                  prefixIcon: Icon(Icons.lock_open_outlined),
                                ),
                              ),
                              SizedBox(height: 5,),
                              ElevatedButton(onPressed: ()async{

                                loading=true;

                                await changeEmail(
                                    email: emailC.text,password: passwordC.text
                                );

                                loading=false;



                              }, child:loading?Center(child: CircularProgressIndicator(color:Colors.black,),):  Text('Submit'))
                            ],
                          ),
                        )
                      ],

                    );
                  }
                  );
                },
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
                  suffixIcon: IconButton(onPressed: () {

                  }, icon: Icon(Icons.edit_outlined),),
                ),
              ),
              widget.phone == null?
                  Visibility(visible:false,child:  TextFormField(

                    readOnly: true,
                    initialValue: widget.phone.toString(),

                    decoration: InputDecoration(
                      hintText: 'Phone number',
                      prefixIcon: const Icon(Icons.phone_android),
                      suffixIcon: IconButton(onPressed: () {

                      }, icon: Icon(Icons.edit_outlined),),
                    ),
                  ))
              :TextFormField(

                readOnly: true,
                initialValue: widget.phone.toString(),

                decoration: InputDecoration(
                  hintText: 'Phone number',
                  prefixIcon: const Icon(Icons.phone_android),
                  suffixIcon: IconButton(onPressed: () {

                  }, icon: Icon(Icons.edit_outlined),),
                ),
              ), //Phone TextField
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onTap: (){
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
                  suffixIcon: IconButton(onPressed: () {
                  }, icon: Icon(Icons.arrow_drop_down_circle_outlined)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person,),
                ),
                hint: Text(widget.gender!.isNotEmpty
                    ? widget.gender!
                    : 'Select Gender'),
                items: ['Male', 'Female'].map(
                      (val) {
                    return DropdownMenuItem<String>(
                      value: val,
                      child: Text(val),
                    );
                  },
                ).toList(), onChanged: (String? val) {
                setState(
                      () {
                    dropDownValue = val;
                  },
                );
              },),
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
                          child: CircularProgressIndicator(color: Colors.blue,))
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
      DocumentReference ref=collectionRef.doc(user.uid);
      final cred =
      EmailAuthProvider.credential(email: user.email!, password: passwordC.text);
      user.reauthenticateWithCredential(cred).then((value) {
        user.updateEmail(email).then((_) async {
          await ref.update({'email': email}).then((value) async {
            // go to root page
            await _auth.currentUser!.sendEmailVerification();
            Fluttertoast.showToast(msg: 'Verification Email has been sent to you');
            await _auth.signOut();

           });
          setState(() {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>VerificationScreen()), (route) => false);
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
