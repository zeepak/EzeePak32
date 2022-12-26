import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../post_Detail_screen.dart';
import 'filter_screen.dart';

class PriceSearchDetail extends StatefulWidget {
  int minPrice;
  int maxPrice;
  String? priceRange='';
  String? allBrand='';

  PriceSearchDetail({Key? key, required this.minPrice, required this.maxPrice,this.priceRange,this.allBrand})
      : super(key: key);

  @override
  State<PriceSearchDetail> createState() => _PriceSearchDetailState();
}

class _PriceSearchDetailState extends State<PriceSearchDetail> {
  var postsRef = FirebaseFirestore.instance.collection('Posts');

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    print(widget.maxPrice);
    return Scaffold(
        body: FutureBuilder<QuerySnapshot>(
      future: postsRef.where('price',isLessThanOrEqualTo: widget.maxPrice).where('price',isGreaterThanOrEqualTo: widget.minPrice).get(GetOptions(source: Source.cache)),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        if(snapshot.data!.docs.isEmpty){
          return Center(child: Text('No Results Found'),);
        }
        return Column(
          children: [
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [
                widget.priceRange==null?

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text.rich(

                          TextSpan(
                              children: [
                                TextSpan(text: 'Showing: ',style: TextStyle(color: Colors.grey)),
                                TextSpan(text: 'price range ${widget.minPrice} to ${widget.maxPrice}',style: TextStyle(fontWeight: FontWeight.bold))
                              ]
                          )
                      ),
                    ],
                  ),
                ):
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text.rich(

                          TextSpan(
                              children: [
                                TextSpan(text: 'Showing: ',style: TextStyle(color: Colors.grey)),
                                TextSpan(text: 'All Phones',style: TextStyle(fontWeight: FontWeight.bold))

                              ]
                          )
                      ),
                    ],
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width*0.09,),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>FilterScreen()));
                  },
                  child: Container(
                    child: Row(
                      children: [
                      Icon(Icons.filter_list,color: Colors.blueAccent,size: 30,),
                      Text('Filter',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12),),
                    ],),
                  ),
                )
              ],
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
