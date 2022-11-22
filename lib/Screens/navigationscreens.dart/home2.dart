import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobihub_2/Screens/navigationscreens.dart/notification.dart';
import 'package:mobihub_2/widgets/brand_container.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home2 extends StatefulWidget {
  const Home2({Key? key}) : super(key: key);

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  var sliderController = CarouselController();
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
    return Scaffold(
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
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(5),
              height: 40,
              decoration: BoxDecoration(
                  color: Color(0xFFBDC8D2),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Row(
                      children: [
                        Icon(Icons.search_outlined),
                        Text(
                          'Search',
                          style: TextStyle(color: Color(0xFF65717B)),
                        )
                      ],
                    ),
                    suffixIcon: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        VerticalDivider(
                          color: Color(0xFF9AA6B0),
                          thickness: 1.5,
                        ),
                        Icon(Icons.location_on_outlined),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'Location',
                              style: TextStyle(color: Colors.black54),
                            ))
                      ],
                    ),
                    // suffixText: 'Loc',suffixStyle: TextStyle(color: Colors.black),

                    border: OutlineInputBorder(borderSide: BorderSide.none)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(

              child:
               Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: 350,
                        height: 150,

                        child:
                        CarouselSlider.builder(
                          itemCount: images.length,

                          itemBuilder:(context,index, realIndex){

                            return    images.isNotEmpty?Container(

                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(

                                        images[index]
                                      )


                                      // NetworkImage(
                                      //
                                      //
                                      // ),
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

                  )


              ),



            //////////////////////

            ////////////////////
            SizedBox(height: 1,),
            Center(child: dotIndicator()),


            SizedBox(
              height: 20,
            ),
            Text(
              'Browser by Brand',
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
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
                    onPressed: () {},
                    child: Image.asset('assets/images/oppo.png'),
                  ),
                  CustomBrand(
                    onPressed: () {},
                    child: Image.asset('assets/images/huawei.png'),
                  ),
                  CustomBrand(
                    onPressed: () {},
                    child: Image.asset('assets/images/vivo.png'),
                  ),
                  CustomBrand(
                    onPressed: () {},
                    child: Image.asset('assets/images/iphone.png'),
                  ),
                  CustomBrand(
                    onPressed: () {},
                    child: Image.asset('assets/images/infinix.png'),
                  ),
                  CustomBrand(
                    onPressed: () {},
                    child: Image.asset('assets/images/mi.png'),
                  ),
                  CustomBrand(
                    onPressed: () {},
                    child: Image.asset('assets/images/realme.png'),
                  ),
                  CustomBrand(
                    onPressed: () {},
                    child: Image.asset('assets/images/samsung.png'),
                  ),
                  CustomBrand(
                    onPressed: () {},
                    child: Image.asset('assets/images/tecno.png'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Browser by Price',
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(onPressed: () {}, child: Text('Below Rs. 10,000')),
                TextButton(
                    onPressed: () {}, child: Text('Rs. 20,000 - Rs. 30,000')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () {}, child: Text('Rs. 10,000 - Rs. 20,000')),
                TextButton(
                    onPressed: () {}, child: Text('Rs. 30,000 - Rs. 40,000')),
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
                Text(
                  'View All',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 5),
              height: 250,
              child: StreamBuilder(
                stream: ref.snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                        child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      enabled: true,
                      child: Text('Loading...'),
                    ));
                  }
                  var data = snapshot.data;
                  return ListView.separated(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: data!.docs.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(15),
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 4,
                                    offset: Offset(4, 8), // Shadow position
                                  ),
                                ],
                                image: DecorationImage(
                                  image: NetworkImage(
                                      data.docs[index]['images'][0]),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            height: 65,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 4,
                                  offset: Offset(4, 8), // Shadow position
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.docs[index]['title'],
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  'PKR ${data.docs[index]['price']}',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  data.docs[index]['location'],
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                      // return Center(child: Text(snapshot.data!.docs.length.toString()),);
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(
                      width: 20,
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
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
