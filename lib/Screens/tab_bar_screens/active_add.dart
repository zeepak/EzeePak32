import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobihub_2/Screens/navigationscreens.dart/post_update_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/consts.dart';
import '../post_Detail_screen.dart';

class ActiveAdsScreen extends StatefulWidget {
  const ActiveAdsScreen({Key? key}) : super(key: key);

  @override
  State<ActiveAdsScreen> createState() => _ActiveAdsScreenState();
}

class _ActiveAdsScreenState extends State<ActiveAdsScreen> {
  SharedPreferences? sharedPreferences;

  Constants controllers =Get.put(Constants());


  bool loading = false;
  var ref = FirebaseFirestore.instance.collection('Posts');
  var userId = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    getShare();
    super.initState();
  }
  getShare()async{
    sharedPreferences=await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      body: SafeArea(
        child: FutureBuilder<QuerySnapshot>(
          future: ref.where('uid', isEqualTo: userId!.uid).get(GetOptions(source: Source.cache)),
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
                  return snapshot.data!.docs[index]['isShow']==false && snapshot.data!.docs[index]['status']=='active'?
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                          margin: const EdgeInsets.all(10.0),
                          child: Container(
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
                                          margin: EdgeInsets.only(right: 25,top: 10),
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
                                              color: Colors.green,
                                              borderRadius: BorderRadius.circular(50)
                                          ),
                                        )

                                      ],
                                    ),
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
                                            Navigator.push(context, MaterialPageRoute(builder: (_)=>PostUpdateScreen()));


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
                                                        print('this is active ${snapshot.data!.docs[index]['postUid'].toString()}');
                                                        Navigator.pop(context);
                                                        setState(() {
                                                          controllers.adUid.add(snapshot.data!.docs[index]['postUid']);
                                                          sharedPreferences!.setStringList('adUid',  controllers.adUid);

                                                        });
                                                        await FirebaseFirestore.instance.collection('Posts').doc(snapshot.data!.docs[index]['postUid'].toString()).update({
                                                          'isShow':true,
                                                        });

                                                        //Constants.adUid= snapshot.data!.docs[index]['uid'];


                                                        print(snapshot.data!.docs[index]['uid']);
                                                      }, child: Text('yes')),
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
                          ))
                    ],
                  ):Container();
                });
          },
        ),
      ),
    );
  }
}
