import 'package:flutter/material.dart';
class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFFFDC3D),
        
        elevation: 1,
  title: const Text('Chats',style: TextStyle(fontFamily: 'Lato',fontSize: 17),),
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