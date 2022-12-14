import 'package:flutter/material.dart';
import 'package:mobihub_2/Screens/tab_bar_screens/active_add.dart';
import 'package:mobihub_2/Screens/tab_bar_screens/favorite_add_screen.dart';

import '../tab_bar_screens/delete_screen.dart';
import '../tab_bar_screens/pending_screen.dart';

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
        body:   TabBarView(children: [
            ActiveAdsScreen(),
            PendingPostScreen(),
            DeleteScreen(),
            FavoriteAddScreen(),
        ]),
      
      ),
    );
  }
}