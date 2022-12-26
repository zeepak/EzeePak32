import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Sellcontroller extends GetxController
{
  final auth=FirebaseAuth.instance.currentUser!.uid;
  RxString postData=''.obs;
  RxBool pressedBool = false.obs;
  RxString city=''.obs;

  @override
void onInit() {

   //getData();

   // print('Data is ${postData.value.capitalize}');
   // postData.bindStream(getData());
  // getData();


    super.onInit();

}
  // Stream<DocumentSnapshot> getData(){
  //   return   FirebaseFirestore.instance.collection('UsersDetails').doc(auth
  //   ).snapshots().map((event){
  //
  //     if(event.exists && event.get('fullName')!=null){
  //       postData.value=event.data()!['fullName'];
  //     }
  //     return event.data()!['fullName'];
  //   });
  // }


}