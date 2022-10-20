import 'package:flutter/material.dart';
import 'package:mobihub_2/Screens/navigationscreens.dart/filter.dart';
import 'package:mobihub_2/Screens/navigationscreens.dart/notification.dart';

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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Notrification()));
            },
            icon: Image.asset(
              'assets/images/img5.png',
              height: 20,
              width: 20,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Filter()));
            },
            icon: Image.asset(
              'assets/images/icon2.png',
              height: 20,
              width: 20,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              color: const Color(0xFFFAFAFA),
            ),
          ],
        ),
      ),
    );
  }
}
