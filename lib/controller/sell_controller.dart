import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mobihub_2/Models/post_model.dart';
import 'package:mobihub_2/Models/user_model.dart';

class Sellcontroller extends GetxController
{
  Rx<UserModel?> postData=Rx<UserModel?>(null);

  @override
void onInit(){
  postData.bindStream(getData());



  super.onInit();

}
  Stream<UserModel> getData(){
    return   FirebaseFirestore.instance.collection('UsersDetails').doc(FirebaseAuth.instance.currentUser!.uid
    ).snapshots().map((event) => UserModel.fromMap(event.data() as Map<String,dynamic>) );
  }

}