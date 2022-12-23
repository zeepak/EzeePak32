import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobihub_2/services/consts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';
class  PostDetailScreen extends StatefulWidget {
  String? title;
  String? desc;
  int? price;
  String? location;
  String? brand;
  String? pta;
  String? condtion;
  String? warranty;
  String? ram;
  String? memory;
  String? camera;
  String? battery;
  String? color;
  String? uid;
  String? name;
  String? number;
  bool? whatsAppSwitch;
  List<dynamic>? images;
  String? postUid;
  String? favoriteAds;
  String? customerId;

   PostDetailScreen({Key? key,this.title, this.images, this.number, this.name, this.whatsAppSwitch, this.uid, this.location, this.color, this.battery,
   this.camera,this.memory,this.ram, this.warranty, this.condtion, this.pta, this.brand, this.price,this.desc
  ,this.postUid ,this.favoriteAds,this.customerId}) : super(key: key);

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  bool favourite =false;
  var carouselController = CarouselController();
  Constants controller = Get.put(Constants());
  var currentIndex=1;
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(

        body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(onPressed: (){
              Navigator.pop(context);
            },icon: Icon(Icons.arrow_circle_left_outlined,color: Colors.white70,size: 25,),),
            snap: true,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text("${widget.title}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ) //TextStyle
              ), //Text
              background: Container(
                child: Stack(
                  children: [
                    CarouselSlider.builder(
                    itemCount: widget.images!.length, itemBuilder: (context,index,realIndex){

                    return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                          widget.images![index],
                        ),
                      ),
                    ),
                      );
                  }, options: CarouselOptions(
                    viewportFraction: 1,
                    autoPlay: false,
                    height: 300,
                    onPageChanged: (int index,realindex){
                      setState(() {
                        currentIndex=index;
                      });
                    }
                  ),
                  ),
                    Positioned(
                      right: 10,
                      child: Container(
                        margin: EdgeInsets.only(top: 215),


                        width: 40,
                        height: 40,
                        child: FloatingActionButton(

                          backgroundColor: Colors.white,
                          onPressed: (){
                            Share.share('https://${PostDetailScreen()}');}

                          ,
                          child: Image.asset('assets/icons/share.png',width: 25,height: 25,color: Colors.black,),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 225,left: 5),
                      height: 30,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Center(child: Text('$currentIndex /${widget.images!.length}',style: TextStyle(color: Colors.white),),),
                    )
                ]
                ),
              ),
            ), //FlexibleSpaceBar
            expandedHeight: 230,
            backgroundColor: Colors.greenAccent[400],

          ), //SliverAppBar

          SliverList(

              delegate: SliverChildListDelegate(
                  [

                    Padding(
                      padding: const EdgeInsets.only(bottom: 20,left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Container(
                          //   margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.8,bottom: 20),
                          //     padding: EdgeInsets.all(15),
                          //     child: Image.asset('assets/icons/share.png',width: 25,height: 25,)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(widget.title.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,wordSpacing: 2,letterSpacing: 1),),
                              IconButton(onPressed: () async {
                                var post =[FirebaseAuth.instance.currentUser!.uid];
                                setState((){
                                  favourite =!favourite;
                                  controller.postUid.value =widget.postUid.toString();
                                  print('Post Uid is = ${widget.postUid.toString()}');

                                });
                                if(favourite ==true){
                                  await FirebaseFirestore.instance.collection('Posts').doc(widget.postUid).update(
                                      {
                                        'customerId':FieldValue.arrayUnion(post),
                                       });

                                  Fluttertoast.showToast(msg: 'Added In Favorite List');

                                }else{

                                  await FirebaseFirestore.instance.collection('Posts').doc(widget.postUid.toString()).update({
                                    'customerId':FieldValue.arrayRemove(post),
                                  });
                                  Fluttertoast.showToast(msg: 'Remove from Favorite List');
                                }
                              }, icon:favourite==true?Icon(CupertinoIcons.heart_solid,color: Colors.redAccent,) :Icon(CupertinoIcons.heart_solid,))
                            ],
                          ),
                          SizedBox(height: 8,),
                          Text('PKR ${widget.price.toString()}',style: TextStyle(fontSize: 14,fontWeight:FontWeight.bold,letterSpacing: 1),),
                          SizedBox(height: 6,),
                          Text(widget.location.toString(),style: TextStyle(fontSize: 14,),),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Image.asset('assets/icons/Brand.png',width: 25,height: 25,),
                                  SizedBox(height: 10,),
                                  Text(widget.brand.toString(),style: TextStyle(fontSize: 10,fontWeight:FontWeight.bold,))
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset('assets/icons/ram.png',width: 25,height: 25,),
                                  SizedBox(height: 10,),
                                  Text(widget.ram.toString(),style: TextStyle(fontSize: 10,fontWeight:FontWeight.bold,))
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset('assets/icons/memory-card.png',width: 25,height: 25,),
                                  SizedBox(height: 10,),
                                  Text(widget.memory.toString(),style: TextStyle(fontSize: 10,fontWeight:FontWeight.bold,))
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset('assets/icons/battery.png',width: 25,height: 25,),
                                  SizedBox(height: 10,),
                                  Text(widget.battery.toString(),style: TextStyle(fontSize: 10,fontWeight:FontWeight.bold,),)
                                ],
                              ),
                            ],
                          ),
                          Divider(),
                          ListTile(
                            visualDensity: VisualDensity(vertical: -4),
                            leading: Text('Location'),
                            trailing: Text(widget.location.toString()),
                          ),
                          Divider(),
                          ListTile(
                            visualDensity: VisualDensity(vertical: -4),
                            leading: Text('PTA'),
                            trailing: Text(widget.pta.toString()),
                          ),
                          Divider(),
                          ListTile(
                            visualDensity: VisualDensity(vertical: -4),
                            leading: Text('Condition'),
                            trailing: Text(widget.condtion.toString()),
                          ),
                          Divider(),
                          ListTile(
                            visualDensity: VisualDensity(vertical: -4),
                            leading: Text('Warranty'),
                            trailing: Text(widget.warranty.toString()),
                          ),
                          Divider(),
                          ListTile(
                            visualDensity: VisualDensity(vertical: -4),
                            leading: Text('Memory'),
                            trailing: Text(widget.memory.toString()),
                          ),
                          Divider(),
                          ListTile(
                            visualDensity: VisualDensity(vertical: -4),
                            leading: Text('Color'),
                            trailing: Text(widget.color.toString()),
                          ),
                          Divider(),
                          ListTile(
                            visualDensity: VisualDensity(vertical: -4),
                            leading: Text('Ram'),
                            trailing: Text(widget.ram.toString()),
                          ),
                          Divider(),
                          SizedBox(height: 10,),
                          Text('Seller Description'),
                          SizedBox(height: 10,),
                          Container(
                              padding: EdgeInsets.all(10),

                              width: MediaQuery.of(context).size.width*0.95,

                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Text(widget.desc.toString())),

                        ],),
                    )
                  ])),

        ], //<Widget>[]
          ),
        bottomNavigationBar: BottomNavigationBar(

          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black54,
          //backgroundColor: Colors.white12,
          items: [
          BottomNavigationBarItem(icon: IconButton(icon:Icon(Icons.call),onPressed: (){
            String? url=
                'tel:${widget.number.toString()}?body=hello%20there';
            launchUrl(Uri.parse(url.toString()),
                mode: LaunchMode.externalApplication);
          },),label: 'Call',),
          BottomNavigationBarItem(icon: IconButton(icon:Icon(Icons.message,),onPressed: (){
            String? url=
                'sms:${widget.number.toString()}?body=hello%20there';
            launchUrl(Uri.parse(url.toString()),
                mode: LaunchMode.externalApplication);
          },),label: 'SMS'),
          widget.whatsAppSwitch ==true ?
          BottomNavigationBarItem(icon: IconButton(icon:Icon(Icons.whatsapp,color: Colors.green,),onPressed: (){
           String? url=
                "https://wa.me/+${widget.number}+?text=Hello Sir";
            launchUrl(Uri.parse(url.toString()),
                mode: LaunchMode.externalApplication);
          },),label: 'Whatsapp')
              :
          BottomNavigationBarItem(icon: IconButton(icon:Icon(Icons.not_interested_rounded,color: Colors.grey,),onPressed: (){
            Fluttertoast.showToast(msg: 'Contact with other way');
          },),label: 'Whatsapp',),

            BottomNavigationBarItem(icon: IconButton(icon:Icon(CupertinoIcons.chat_bubble_fill),onPressed: (){
              Fluttertoast.showToast(msg: 'in Progress...');
            },),label: 'Chat'),
        ],
          
        ),

      ) ;//Custon
  }

}

//