import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/consts.dart';
import '../post_Detail_screen.dart';
class DeleteScreen extends StatefulWidget {
   DeleteScreen({Key? key, }) : super(key: key);

  @override
  State<DeleteScreen> createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {
  SharedPreferences? sharedPreferences;
  Constants constants=Constants();
  @override
  void initState() {
    getShare();
    super.initState();
  }
  getShare()async{
    sharedPreferences=await SharedPreferences.getInstance();
    List<String>? data= sharedPreferences!.getStringList('adUid');
    constants.adUid=data!.toList();
    print(constants.adUid.length);
  }
  bool loading = false;
  var ref = FirebaseFirestore.instance.collection('Posts');
  var userId = FirebaseAuth.instance.currentUser;
  Constants controller=Get.put(Constants());

  @override
  Widget build(BuildContext context) {
    print('i dont know${controller.adUid.length}');
    return
      Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: ref.where('uid', isEqualTo:userId!.uid).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if(snapshot.data!.docs.isEmpty){
            return Center(child: Text('No Ads Yet'),);
          }
          var data = snapshot.data!;
          return ListView.builder(
              itemCount: data.docs.length,
              itemBuilder: (context, index) {
                return snapshot.data!.docs[index]['isShow']==true?
                Column(

                  children: [

                    Card(
                        margin: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: (){
                                Get.to(()=>PostDetailScreen(
                                  images:snapshot.data!.docs[index]['images'],
                                  title:snapshot.data!.docs[index]['title'] ,
                                  desc:snapshot.data!.docs[index]['desc'] ,
                                  number:snapshot.data!.docs[index]['number'] ,
                                  location:snapshot.data!.docs[index]['location'] ,
                                  warranty:snapshot.data!.docs[index]['warranty'] ,
                                  ram:snapshot.data!.docs[index]['ram'] ,
                                  pta:snapshot.data!.docs[index]['pta'] ,
                                  price:snapshot.data!.docs[index]['price'] ,
                                  memory:snapshot.data!.docs[index]['memory'] ,
                                  uid:snapshot.data!.docs[index]['uid'] ,
                                  name:snapshot.data!.docs[index]['name'] ,
                                  battery:snapshot.data!.docs[index]['battery'] ,
                                  brand:snapshot.data!.docs[index]['brand'] ,
                                  camera:snapshot.data!.docs[index]['camera'] ,
                                  condtion:snapshot.data!.docs[index]['condtion'] ,
                                  color:snapshot.data!.docs[index]['color'] ,
                                  whatsAppSwitch:snapshot.data!.docs[index]['whatsAppSwitch'] ,
                                  postUid:snapshot.data!.docs[index]['postUid'] ,






                                ));
                              },
                              child: Container(
                                height: 80,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        snapshot.data!.docs[index]['images'][0],
                                        fit: BoxFit.cover,
                                        width: 100,
                                        height: 80,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(snapshot.data!.docs[index]['title']),
                                          Text.rich(

                                              TextSpan(
                                                  children: [
                                                    TextSpan(text: 'PKR '),
                                                    TextSpan(text: snapshot.data!.docs[index]['price'].toString(),style: TextStyle(fontWeight: FontWeight.bold))
                                                  ]
                                              )
                                          ),
                                          Text(snapshot.data!.docs[index]['location'].toString(),style: TextStyle(fontSize: 12,),),
                                          SizedBox(height: 4,),
                                          Row(

                                            children: [
                                              Text('${snapshot.data!.docs[index]['pta']}',style: TextStyle(fontSize: 12,),),

                                              SizedBox(width: 15,),
                                              Text('${snapshot.data!.docs[index]['ram']}',style: TextStyle(fontSize: 12,),),

                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                        color: Colors.black87,
                                        borderRadius: BorderRadius.circular(50)
                                      ),
                                    )

                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      width: 130,
                                      height: 40,
                                      child: TextButton(onPressed: ()async{
                                        await ref.doc(constants.adUid[index]).update({
                                          'isShow':false
                                        });
                                        sharedPreferences!.setStringList('adUid',  constants.adUid);
                                        Fluttertoast.showToast(msg: 'Ad activated again');


                                      },
                                        style: TextButton.styleFrom(
                                          backgroundColor:Color(0xFFD9D9D9),
                                        ), child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text('Re-Activate',style: TextStyle(color: Colors.black87),),
                                            Icon(Icons.update_outlined,color: Colors.black87,)
                                          ],),),
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      width: 130,
                                      height: 40,
                                      child: TextButton(onPressed: (){
                                        showDialog(
                                            barrierDismissible: false,
                                            context: context, builder: (context){
                                          return AlertDialog(
                                            title: Text('Confirmation!!'),
                                            content: Text('Are you sure to delete permanent?'),
                                            actions: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  TextButton(onPressed: (){
                                                    Navigator.pop(context);
                                                  }, child: Text('No')),
                                                  Container(),
                                                  TextButton(onPressed: ()async{
                                                    await FirebaseFirestore.instance.collection('Posts').doc(controller.adUid[index]).delete();
                                                    Navigator.pop(context);

                                                  }, child: Text('yes')),
                                                ],
                                              )

                                            ],
                                          );
                                        });
                                      }, child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text('Delete',style: TextStyle(color: Colors.black87),),
                                          Icon(CupertinoIcons.delete,color: Colors.black87,)
                                        ],),
                                        style: TextButton.styleFrom(
                                          backgroundColor:Color(0xFFFFDC3D),
                                        ),),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ))
                  ],
                ):Container();
              });
        },
      ),
    );
  }
}
