import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../post_Detail_screen.dart';

class FilterDetailScreen extends StatefulWidget {
  int price;
  String? location;
  String? pta;
  String? brand;
  String? warranty;
  String? ram;
  String? memory;
  String? camera;

  FilterDetailScreen({Key? key,required this.price, required this.location, required this.pta,
    required this.brand, required this.warranty, required this.ram, required this.memory,required this.camera
  })
      : super(key: key);

  @override
  State<FilterDetailScreen> createState() => _FilterDetailScreenState();
}

class _FilterDetailScreenState extends State<FilterDetailScreen> {
  var postsRef = FirebaseFirestore.instance.collection('Posts');

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<QuerySnapshot>(
          future: postsRef.where('price',isEqualTo: widget.price).where('location',isEqualTo: widget.location).where('pta',isEqualTo: widget.pta)
          .where('brand',isEqualTo: widget.brand).where('warranty',isEqualTo: widget.warranty).where('ram',isEqualTo: widget.ram).where('memory',isEqualTo: widget.memory)
          .where('camera',isEqualTo: widget.camera).get(GetOptions(source: Source.cache)),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            if(snapshot.data!.docs.isEmpty){
              return Center(child: Text('No Results Found'),);
            }
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20,top: 15),
                  child: Text('Showing Filter Result',style: TextStyle(fontWeight: FontWeight.bold),),
                ),

                Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return  snapshot.data!.docs[index]['isShow']==true|| snapshot.data!.docs[index]['status']=='pending'?
                        Container():InkWell(
                          onTap: () {
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
                          child: Container(
                            height: 140,
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                            child: Card(
                              semanticContainer: true,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                        width: 100,
                                        height: 80,
                                        padding: EdgeInsets.only(left: 10, top: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                  snapshot.data!.docs[index]['images'][0],
                                                ))),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 20, top: 20),
                                      child: Column(
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
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_right_rounded,
                                      size: 25,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            );
          },
        ));


  }

}
