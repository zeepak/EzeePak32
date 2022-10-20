import 'package:flutter/material.dart';

class Notrification extends StatefulWidget {
  const Notrification({super.key});

  @override
  State<Notrification> createState() => _NotrificationState();
}

class _NotrificationState extends State<Notrification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       appBar: AppBar(
        backgroundColor: const Color(0xFFFFDC3D),
        title: const Text(
          'Notification',
          style: TextStyle(fontFamily: 'Lato', fontSize: 17),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 1,
      ),
      body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              
              Center(child: Text('No Notification Yet?', style: TextStyle(fontFamily: 'Lato',fontSize: 20),)),
              
            ],
          ),
        ),
      
    );
  }
}