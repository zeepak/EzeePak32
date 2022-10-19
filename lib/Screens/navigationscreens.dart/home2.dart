import 'package:flutter/material.dart';

class Home2 extends StatefulWidget {
  const Home2({Key? key}) : super(key: key);

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      body:  SingleChildScrollView(
        child: Column(
            children: [
              Container(
                height: 200,
                width: 99999999,
                color: const Color(0xFFFAFAFA),

                
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                           Image.asset(
            'assets/images/img4.png',
            height: 70,
            width: 70,
          ),
          const SizedBox(width: 190,),
          IconButton(
            onPressed: (){},
             icon: Image.asset('assets/images/img5.png',
                 height: 20,width: 20,),
             ),
             
          IconButton(
            onPressed: (){},
             icon: Image.asset('assets/images/icon2.png',
                 height: 20,width: 20,),
             ),
                          ],
                        ),
                      
                        
                      ],
                    ),
                  ),
                
              ),
            ],
          ),
      ),
      
    );
  }
}
