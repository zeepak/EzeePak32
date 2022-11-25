import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ActiveAdsScreen extends StatefulWidget {
    const ActiveAdsScreen({Key? key}) : super(key: key);

  @override
  State<ActiveAdsScreen> createState() => _ActiveAdsScreenState();
}
class _ActiveAdsScreenState extends State<ActiveAdsScreen> {
  bool loading = false;
  var ref = FirebaseFirestore.instance.collection('Posts');
  var userId = FirebaseAuth.instance.currentUser;



  @override
  void initState() {




    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:StreamBuilder<QuerySnapshot>(
        stream:ref.where('uid',isEqualTo: userId!.uid).snapshots(),
        builder: (context,snapshot){
          if(!snapshot.hasData)
            {
             return Center(child: CircularProgressIndicator(),);
            }
          var data =snapshot.data! ;
          return ListView.builder(

              itemCount:data.docs.length,

              itemBuilder: (context,index){
            return Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(data.docs[index]['images'][0]),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(

                        children: const [
                          Icon(Icons.visibility,color: Colors.white,),
                          Text('0',style: TextStyle(color: Colors.white),),
                        ],
                      ),
                      Row(
                        children: const [
                           Icon(Icons.phone_rounded,color: Colors.white,),
                          Text('0',style: TextStyle(color: Colors.white),),
                        ],
                      )
                    ],
                  ),

                )
              ],
            );
          });
        },
      ),
    );
  }
}
