import 'package:flutter/material.dart';

class Youradds extends StatefulWidget {
  const Youradds({Key? key}) : super(key: key);

  @override
  State<Youradds> createState() => _YouraddsState();
}

class _YouraddsState extends State<Youradds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFDC3D),
        
        elevation: 1,
  title: const Text('My Ads',style: TextStyle(fontFamily: 'Lato',fontSize: 17),),
      ),
      backgroundColor: Colors.white,
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text('')
      ],
    ),
    );
  }
}