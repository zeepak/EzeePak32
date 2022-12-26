import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobihub_2/Screens/tab_bar_screens/pending_update_screen.dart';
import 'package:mobihub_2/services/consts.dart';
import 'package:get/get.dart';

import '../post_Detail_screen.dart';
class PendingPostScreen extends StatefulWidget {

  const PendingPostScreen({Key? key,}) : super(key: key);

  @override
  State<PendingPostScreen> createState() => _PendingPostScreenState();
}

class _PendingPostScreenState extends State<PendingPostScreen> {

  var ref = FirebaseFirestore.instance.collection('Posts');
  var userId = FirebaseAuth.instance.currentUser!.uid;
  Constants controller =Get.put(Constants());



  @override
  void initState() {
    //print ( favoriteRef.doc().snapshots().forEach((element) {element.get('uid');}));

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          body: StreamBuilder<QuerySnapshot>(
            stream: ref.get().asStream(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.data!.docs.isEmpty) {
                return
                  Center(
                    child: Text('No pending Ad yet '),
                  );
              }
              return
                ListView.separated(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return snapshot.data!.docs[index]['status']=='pending' && snapshot.data!.docs[index]['uid']==FirebaseAuth.instance.currentUser!.uid?
                    Card(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: (){
                                Get.to(() => PostDetailScreen(
                                  images: snapshot.data!.docs[index]['images'],
                                  title: snapshot.data!.docs[index]['title'],
                                  desc: snapshot.data!.docs[index]['desc'],
                                  number: snapshot.data!.docs[index]['number'],
                                  location: snapshot.data!.docs[index]['location'],
                                  warranty: snapshot.data!.docs[index]['warranty'],
                                  ram: snapshot.data!.docs[index]['ram'],
                                  pta: snapshot.data!.docs[index]['pta'],
                                  price: snapshot.data!.docs[index]['price'],
                                  memory: snapshot.data!.docs[index]['memory'],
                                  uid: snapshot.data!.docs[index]['uid'],
                                  name: snapshot.data!.docs[index]['name'],
                                  battery: snapshot.data!.docs[index]['battery'],
                                  brand: snapshot.data!.docs[index]['brand'],
                                  camera: snapshot.data!.docs[index]['camera'],
                                  condtion: snapshot.data!.docs[index]['condtion'],
                                  color: snapshot.data!.docs[index]['color'],
                                  whatsAppSwitch: snapshot.data!.docs[index]
                                  ['whatsAppSwitch'],
                                ));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        snapshot.data!.docs[index]['images'][0],
                                        width: 100,
                                        height: 80,
                                        fit: BoxFit.cover,
                                      )),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(snapshot.data!.docs[index]['title']),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text.rich(TextSpan(children: [
                                        TextSpan(text: 'PKR '),
                                        TextSpan(
                                            text: snapshot.data?.docs[index]['price']
                                                .toString() ??
                                                'MyDefault',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))
                                      ])),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        snapshot.data!.docs[index]['location'],
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '${snapshot.data!.docs[index]['pta']}',
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            '${snapshot.data!.docs[index]['ram']}',
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  //SizedBox(width: 60,),
                                  Container(
                                    margin: EdgeInsets.only(left: 50),
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                        color: Colors.yellow,
                                        borderRadius: BorderRadius.circular(50)
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  16.0, 12.0, 16.0, 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      width: 130,
                                      height: 40,
                                      child: TextButton(onPressed: (){
                                        Get.to(()=>PendingUpdateScreen(
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
                                          postUid:snapshot.data!.docs[index]['postUid'] ,));


                                      },
                                        style: TextButton.styleFrom(
                                          backgroundColor:Color(0xFFD9D9D9),
                                        ), child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text('Edit',style: TextStyle(color: Colors.black87,),),
                                            Icon(Icons.edit,color: Colors.black87,)
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
                                            title: Text('Confirmation!'),
                                            content: Text('Are you sure to delete?'),
                                            actions: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  TextButton(onPressed: (){
                                                    Navigator.pop(context);
                                                  }, child: Text('No')),
                                                  Container(),
                                                  TextButton(onPressed: ()async{
                                                    await FirebaseFirestore.instance.collection('Posts').doc(snapshot.data!.docs[index]['postUid']).delete();
                                                    Navigator.pop(context);
                                                    setState(() {

                                                    });
                                                  }, child: Text('Yes')),

                                                ],
                                              )

                                            ],
                                          );
                                        });
                                      },
                                        style: TextButton.styleFrom(
                                          backgroundColor:Color(0xFFFFDC3D),
                                        ), child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text('Delete',style: TextStyle(color: Colors.black87),),
                                            Icon(CupertinoIcons.delete,color: Colors.black87,)
                                          ],),),
                                    ),
                                  ),
                                ],
                              ),
                            )

                          ],
                        ),
                      ),
                    ):Container();
                  },
                  separatorBuilder: (context, counter) => SizedBox(
                    height: 10,
                  ),
                );
            },
          ));
  }

}

