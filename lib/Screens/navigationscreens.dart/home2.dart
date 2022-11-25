import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobihub_2/Screens/navigationscreens.dart/notification.dart';
import 'package:mobihub_2/widgets/brand_container.dart';
import 'package:mobihub_2/widgets/text_button.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../search_screens/home_screen_location_search.dart';
import '../search_screens/home_screen_searchbar.dart';

class Home2 extends StatefulWidget {
  const Home2({Key? key}) : super(key: key);

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
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
                  color: const Color(0xFFEFEFEF),
                  borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
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

                ),
            SizedBox(height: 3,),
            Center(child: dotIndicator()),


            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Browser by Brand',
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: 15),
                ),
                GestureDetector(
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

                   child: CustomTextButton(text: 'Below Rs. 10,000', onPressed: (){})),
               CustomTextButton(text: 'Rs. 20,000 - Rs. 30,000', onPressed: (){}),
             ],
           ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextButton(text: 'Rs. 10,000 - Rs. 20,000', onPressed: (){}),
                CustomTextButton(text: 'Rs. 30,000 - Rs. 40,000', onPressed: (){}),
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
              child: StreamBuilder(
                stream: ref.snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData && snapshot.connectionState == ConnectionState.waiting) {
                    return SizedBox(
                      child: Shimmer.fromColors(
                        baseColor: Colors.white,
                        highlightColor: Colors.grey,
                        period: const Duration(milliseconds: 2500),
                        child: Text("HELLO"),
                      ),
                    );
                  }
                  var data = snapshot.data;
                  return ListView.separated(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: data!.docs.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Stack(
                            children: [

                              Positioned(
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 35,),
                                  width: 184,
                                  height:160,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                        5
                                    ),
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.black.withOpacity(0.03),
                                        Colors.black.withOpacity(0.0),
                                        Colors.black.withOpacity(0.03), //This controls the darkness of the bar
                                      ],
                                      // stops: [0, 1], if you want to adjust the gradiet this is where you would do it
                                    ),
                                  ),

                                  child: Container(

                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        color: Colors.white,

                                        image: DecorationImage(
                                          image: NetworkImage(
                                              data.docs[index]['images'][0]),
                                          fit: BoxFit.cover,
                                        ),



                                     // borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 4,
                                          offset: Offset(4, 8), // Shadow position
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                  right: -10,
                                  top: -5,
                                  child: IconButton(
                                onPressed: (){},
                                icon: Icon(CupertinoIcons.heart,color: Colors.black,),
                              )),

                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            height: 85,
                            width: 184,
                            decoration: const BoxDecoration(
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
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  'PKR ${data.docs[index]['price']}',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  data.docs[index]['location'],
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(data.docs[index]['brand'],style: TextStyle(fontSize: 11),),
                                    Container(height: 10, child: VerticalDivider(color: Colors.grey,thickness: 1,)),
                                    Text(data.docs[index]['pta'],style: TextStyle(fontSize: 11),),
                                    Container(height: 10, child: VerticalDivider(color: Colors.grey,thickness: 1,)),
                                    Text(data.docs[index]['ram'],style: TextStyle(fontSize: 11),),
                                  ],
                                )
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
