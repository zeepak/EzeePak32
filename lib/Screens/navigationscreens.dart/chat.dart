import 'package:flutter/material.dart';
class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(tabs: [
            Tab(text: 'All',),
            Tab(text: 'Buying'),
            Tab(text: 'Selling'),
            
          ]),
          centerTitle: true,
          
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFFFFDC3D),
          
          elevation: 1,
      title: const Text('Chats',style: TextStyle(fontFamily: 'Lato',fontSize: 17),),
        ),
        backgroundColor: Colors.white,
      body: const TabBarView(children: [
            Center(child: Text('Still in Progress...',style: TextStyle(fontFamily: 'Lato',fontSize: 20),),),
            // Center(child: Text('No Message yet?',style: TextStyle(fontFamily: 'Lato',fontSize: 20),),),
            // Center(child: Text('No Message yet?',style: TextStyle(fontFamily: 'Lato',fontSize: 20),),),
           
        ]),
      ),
    );
  }
}