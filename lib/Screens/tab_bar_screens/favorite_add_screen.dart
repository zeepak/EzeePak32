import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobihub_2/Firebase/google.dart';
import 'package:mobihub_2/services/consts.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../post_Detail_screen.dart';
class FavoriteAddScreen extends StatefulWidget {

   const FavoriteAddScreen({Key? key,}) : super(key: key);

  @override
  State<FavoriteAddScreen> createState() => _FavoriteAddScreenState();
}

class _FavoriteAddScreenState extends State<FavoriteAddScreen> {

  var ref = FirebaseFirestore.instance.collection('Posts');
  var auth = FirebaseAuth.instance.currentUser!.uid;
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
        body: SafeArea(
          child:
          StreamBuilder(
            stream: ref.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return
                 Center(
                   child: CircularProgressIndicator(),
                 );
              }
              return ListView.separated(
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {

                 List<dynamic> id=snapshot.data!.docs[index]['customerId'];
                  return id.contains(auth) || snapshot.data!.docs[index]['isShow']=='false'?
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
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Card(

                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(snapshot.data!.docs[index]['images'][0],
                                      width: 120,
                                      height: 80,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Column(
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
                                    ],
                                  ),
                                  IconButton(onPressed: ()async{
                                    var post =[FirebaseAuth.instance.currentUser!.uid];
                                    await FirebaseFirestore.instance.collection('Posts').doc(snapshot.data!.docs[index]['postUid']).update({
                                      'customerId':FieldValue.arrayRemove(post),
                                    });
                                    Fluttertoast.showToast(msg: 'Remove from Favorite List');
                                    setState(() {

                                    });
                                  }, icon: Icon(Icons.favorite_rounded,color: Colors.red,))
                                ],
                              ),
                            ),
                          ),
                        )

                      ],
                    ),
                  )
                  :Container();
                },
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(
                      width: 20,
                    ),
              );
            },

          ),
        ),
      );
  }

}

