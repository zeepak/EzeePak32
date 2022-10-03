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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset(
          'assets/images/img2.png',
          height: 70,
          width: 70,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 90,
              width: 99999999,
              color: const Color(0xFFFAFAFA),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: const [
                       
                      ],
                    ),
                    const SizedBox(height: 25),
                    Row(
                      children: const [],
                    )
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
