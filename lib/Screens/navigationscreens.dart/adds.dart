import 'package:flutter/material.dart';

class Youradds extends StatefulWidget {
  const Youradds({Key? key}) : super(key: key);

  @override
  State<Youradds> createState() => _YouraddsState();
}

class _YouraddsState extends State<Youradds> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(tabs: [
            Tab(text: 'Active',),
            Tab(text: 'Pending'),
            Tab(text: 'Delete'),
            Tab(text: 'Favourit'),
          ]),
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFFFFDC3D),
          
          elevation: 1,
          centerTitle: true,
      title: const Text('My Ads',style: TextStyle(fontFamily: 'Lato',fontSize: 17),),
        ),
        backgroundColor: Colors.white,
        body: const TabBarView(children: [
            Center(child: Text('No active ads yet'),),
            Center(child: Text('No pending ads yet'),),
            Center(child: Text('No delete ads yet'),),
            Center(child: Text('No favourit ads yet'),),
        ]),
      
      ),
    );
  }
}