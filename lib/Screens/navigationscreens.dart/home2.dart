import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobihub_2/Models/post_model.dart';
import 'package:mobihub_2/Screens/navigationscreens.dart/notification.dart';
import 'package:mobihub_2/Screens/post_Detail_screen.dart';
import 'package:mobihub_2/Screens/search_screens/price_search_detail.dart';
import 'package:mobihub_2/widgets/brand_container.dart';
import 'package:mobihub_2/widgets/text_button.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../controller/sell_controller.dart';
import '../search_screens/brand_search_detail_screen.dart';
import '../search_screens/home_screen_location_search.dart';
import '../search_screens/home_screen_searchbar.dart';

class Home2 extends StatefulWidget {
  const Home2({Key? key}) : super(key: key);

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  Sellcontroller sellcontroller=Get.put(Sellcontroller());
  var postModel = PostModel();
  var sliderController = CarouselController();
  var city = TextEditingController();
   int currentIndex=0 ;
  List<dynamic> images=[];

  Future _getDataFromDatabase() async {
    await FirebaseFirestore.instance
        .collection("banner")
        .doc('Jv81mMz7qf1hCEpJ95GU')
        .get()
        .then((snapshot) async {
          if(!snapshot.exists){
            return Center(child: CircularProgressIndicator(),);
          }
      if (snapshot.exists &&
          snapshot.get('images') != null){
        setState(() {
          images.addAll(snapshot.data()!['images']);
        });
      }
    });
  }
  var ref = FirebaseFirestore.instance.collection('Posts');
  @override
  void initState() {
    _getDataFromDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(sellcontroller.city.value);
    return
      Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAFAFA),
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Image.asset(
          'assets/images/img4.png',
          height: 70,
          width: 70,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Notrification()));
            },
            icon: Image.asset(
              'assets/images/img5.png',
              height: 20,
              width: 20,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(5),
              height: 40,
              decoration: BoxDecoration(
                  color: const Color(0xFFEFEFEF),
                  borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                readOnly: true,
             onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (_)=>HomeScreenSearchBar()));
             },
                style: const TextStyle(color: Colors.black),
                cursorColor: Colors.blue,

                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(
                    top: 15,
                  ),
                    prefixIcon: const Icon(Icons.search_outlined),
                    hintText: 'search',

                    suffixIcon: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                           Container(height: 30, child: VerticalDivider(color: Colors.grey,thickness: 1.5,)),
                          const Icon(Icons.location_on_outlined),
                          TextButton(
                              onPressed: () async{
                              city.text=await  Navigator.of(context).push(MaterialPageRoute(builder: (_)=>HomeScreenLocationSearch()));
                              setState(() {
                              });
                              },
                              child: city.text.isNotEmpty?Text(
                                city.text,overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.black54),
                              ):Text(
                                'Location',
                                style: TextStyle(color: Colors.black54),
                              ),
                          )
                        ],
                      ),
                    ),
                    // suffixText: 'Loc',suffixStyle: TextStyle(color: Colors.black),

                    border: const OutlineInputBorder(borderSide: BorderSide.none)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
             Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: 350,
                      height: 150,

                      child:
                      CarouselSlider.builder(
                        itemCount: images.length,

                        itemBuilder:(context,index, realIndex){

                          return    images.isNotEmpty?
                          Container(

                            decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(

                                      images[index]
                                    )


                                ),
                            ),
                          ):Center(child: CircularProgressIndicator());
                        },
                        options: CarouselOptions(
                          //height: 150,
                            viewportFraction: 1,
                            autoPlay: true,
                          onPageChanged: (index,reason){
                              setState(() {
                                currentIndex =index;
                              });

                          }


                            ),
                      ),

                    ),
                  ),

                ),
            SizedBox(height: 3,),
            Center(child: dotIndicator()),


            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Browse by Brand
                Text(
                  'Browser by Brand',
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: 15),
                ),
                GestureDetector(
                  onTap: (){
                    int minPrice=1000;
                    int maxPrice=1000000;
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>PriceSearchDetail(minPrice: minPrice, maxPrice: maxPrice,priceRange: 'brands',)));

                  },
                  child: Text(
                    'View All',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 13),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CustomBrand(
                    onPressed: () {
                      String brand='Oppo';
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>BrandSearchDetailScreen(brand:brand)));


                    },
                    child: Image.asset('assets/images/oppo.png'),
                  ),
                  CustomBrand(
                    onPressed: () {
                      String brand='Huawei';
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>BrandSearchDetailScreen(brand:brand)));
                    },
                    child: Image.asset('assets/images/huawei.png'),
                  ),
                  CustomBrand(
                    onPressed: () {
                      String brand='Vivo';
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>BrandSearchDetailScreen(brand:brand)));
                    },
                    child: Image.asset('assets/images/vivo.png'),
                  ),
                  CustomBrand(
                    onPressed: () {
                      String brand='Apple';
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>BrandSearchDetailScreen(brand:brand)));
                    },
                    child: Image.asset('assets/images/iphone.png'),
                  ),
                  CustomBrand(
                    onPressed: () {
                      String brand='Infinix';
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>BrandSearchDetailScreen(brand:brand)));
                    },
                    child: Image.asset('assets/images/infinix.png'),
                  ),
                  CustomBrand(
                    onPressed: () {
                      String brand='Mi';
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>BrandSearchDetailScreen(brand:brand)));
                    },
                    child: Image.asset('assets/images/mi.png'),
                  ),
                  CustomBrand(
                    onPressed: () {
                      String brand='Realme';
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>BrandSearchDetailScreen(brand:brand)));
                    },
                    child: Image.asset('assets/images/realme.png'),
                  ),
                  CustomBrand(
                    onPressed: () {
                      String brand='Samsung';
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>BrandSearchDetailScreen(brand:brand)));
                    },
                    child: Image.asset('assets/images/samsung.png'),
                  ),
                  CustomBrand(
                    onPressed: () {
                      String brand='Tecno';
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>BrandSearchDetailScreen(brand:brand)));
                    },
                    child: Image.asset('assets/images/tecno.png'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //Browse by Price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Browser by Price',
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: 15),
                ),
                GestureDetector(
                  onTap: (){
                    int minPrice=1000;
                    int maxPrice=300000;
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>PriceSearchDetail(minPrice: minPrice, maxPrice: maxPrice,priceRange: 'All Price Phones',)));


                  },
                  child: Text(
                    'View All',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 13),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Container(
                 height: 36,
                   width: 150,
                   decoration: BoxDecoration(
                     color: Color(0xFFEFEFEF),
                     borderRadius: BorderRadius.circular(3),
                   ),

                   child: CustomTextButton(text: 'Below Rs. 10,000', onPressed: () {
                     int minPrice=5000;
                     int maxPrice=19000;
                     Navigator.push(context, MaterialPageRoute(builder: (_)=>PriceSearchDetail(minPrice: minPrice, maxPrice: maxPrice)));

                   }, )),
               CustomTextButton(text: 'Rs. 20,000  -  Rs. 30,000', onPressed: (){
                 int minPrice=20000;
                 int maxPrice=30000;
                 Navigator.push(context, MaterialPageRoute(builder: (_)=>PriceSearchDetail(minPrice: minPrice, maxPrice: maxPrice)));

               }),
             ],
           ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextButton(text: 'Rs. 30,000 - Rs. 50,000', onPressed: (){
                  int minPrice=30000;
                  int maxPrice=50000;
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>PriceSearchDetail(minPrice: minPrice, maxPrice: maxPrice)));
                }),
                CustomTextButton(text: 'Rs. 50,000 - Rs. 100,000', onPressed: (){
                  int minPrice=50000;
                  int maxPrice=100000;
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>PriceSearchDetail(minPrice: minPrice, maxPrice: maxPrice)));
                }),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular Ads',
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: 15),
                ),
                GestureDetector(
                  onTap: (){
                    int minPrice=1000;
                    int maxPrice=100000;
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>PriceSearchDetail(minPrice: minPrice, maxPrice: maxPrice,priceRange: 'Popular Ads',)));

                  },
                  child: Text(
                    'View All',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 13),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 5),
              height: 250,
              child:
              StreamBuilder(
                stream: ref.snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return
                      SizedBox(
                      child: Shimmer.fromColors(
                        baseColor: Colors.white,
                        highlightColor: Colors.grey,
                        period: const Duration(milliseconds: 2500),
                        child: Text("HELLO"),
                      ),
                    );
                  }
                  return ListView.separated(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return  snapshot.data!.docs[index]['isShow']==true || snapshot.data!.docs[index]['status']=='pending'?
                      Container():InkWell(
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
                            favoriteAds:snapshot.data!.docs[index]['favoriteAds'] ,





                          ));
                        },
                        child: Card(

                          child: Container(


                            padding: EdgeInsets.all(10),
                            child:Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.030),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10
                                    ),
                                    child: CachedNetworkImage(
                                    imageUrl: snapshot.data!.docs[index]['images'][0],
                                      width: 150,
                                      height: 140,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(snapshot.data!.docs[index]['title'], style: TextStyle(fontSize: 17,
                                        fontWeight: FontWeight.w500),),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'PKR ${snapshot.data!.docs[index]['price']}',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      snapshot.data!.docs[index]['location'].toString(),
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(height: 5,),
                                  ],
                                ),
                            Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(snapshot.data!.docs[index]['brand'].toString(),style: TextStyle(fontSize: 11),overflow: TextOverflow.ellipsis,),
                                      Container(height: 10, child: VerticalDivider(color: Colors.grey,thickness: 1,)),
                                      Text(snapshot.data!.docs[index]['pta'].toString(),style: TextStyle(fontSize: 11),overflow: TextOverflow.ellipsis,),
                                      Container(height: 10, child: VerticalDivider(color: Colors.grey,thickness: 1,)),
                                      Text(snapshot.data!.docs[index]['ram'].toString(),style: TextStyle(fontSize: 11,),overflow: TextOverflow.ellipsis,),
                                    ],
                                  )

                              ],
                            ) ,
                          ),
                        )

                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(
                      width: 10,
                    ),
                  );
                },

              ),
            ),
  ],
  ),
        )
    );


  }

  Widget dotIndicator() => AnimatedSmoothIndicator(
    activeIndex: currentIndex,
    count: images.length,

    effect: const WormEffect(
        dotHeight: 10,
        dotWidth: 10,
        dotColor: Colors.grey,
        activeDotColor: Colors.red),
  );

}
// Column(
//                           children: [
//                             Container(
//                               padding: EdgeInsets.symmetric(horizontal: 35,),
//                               width: 250,
//                               height:160,
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(
//                                     5
//                                 ),
//                                 gradient: LinearGradient(
//                                   colors: [
//                                     Colors.black.withOpacity(0.03),
//                                     Colors.black.withOpacity(0.0),
//                                     Colors.black.withOpacity(0.03), //This controls the darkness of the bar
//                                   ],
//                                   // stops: [0, 1], if you want to adjust the gradiet this is where you would do it
//                                 ),
//                               ),
//
//                               child: Container(
//
//                                 height: 150,
//                                 width: 150,
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//
//                                   image: DecorationImage(
//                                     image: CachedNetworkImageProvider(
//                                         snapshot.data!.docs[index]['images'][0]
//                                     ),
//                                     fit: BoxFit.cover,
//                                   ),
//
//
//
//                                   // borderRadius: BorderRadius.circular(10),
//                                   boxShadow: const [
//                                     BoxShadow(
//                                       color: Colors.grey,
//                                       blurRadius: 4,
//                                       offset: Offset(4, 8), // Shadow position
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               padding: const EdgeInsets.all(5),
//                               height: 85,
//                               width: 250,
//                               decoration: const BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.only(
//                                     bottomLeft: Radius.circular(10),
//                                     bottomRight: Radius.circular(10)),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.grey,
//                                     blurRadius: 1,
//                                     offset: Offset(2, 2), // Shadow position
//                                   ),
//                                 ],
//                               ),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     snapshot.data!.docs[index]['title'],
//
//                                     style: TextStyle(
//                                         fontSize: 17,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                   SizedBox(
//                                     height: 3,
//                                   ),
//                                   Text(
//                                     'PKR ${snapshot.data!.docs[index]['price']}',
//                                     style: TextStyle(
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                   SizedBox(
//                                     height: 5,
//                                   ),
//                                   Text(
//                                     snapshot.data!.docs[index]['location'].toString(),
//                                     style: TextStyle(
//                                         fontSize: 13,
//                                         fontWeight: FontWeight.w400),
//                                   ),
//                                   SizedBox(height: 5,),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                     children: [
//                                       Text(snapshot.data!.docs[index]['brand'].toString(),style: TextStyle(fontSize: 11),overflow: TextOverflow.ellipsis,),
//                                       Container(height: 10, child: VerticalDivider(color: Colors.grey,thickness: 1,)),
//                                       Text(snapshot.data!.docs[index]['pta'].toString(),style: TextStyle(fontSize: 11),overflow: TextOverflow.ellipsis,),
//                                       Container(height: 10, child: VerticalDivider(color: Colors.grey,thickness: 1,)),
//                                       Text(snapshot.data!.docs[index]['ram'].toString(),style: TextStyle(fontSize: 11,),overflow: TextOverflow.ellipsis,),
//                                     ],
//                                   )
//                                 ],
//                               ),
//                             ),
//
//                           ],
//                         ),