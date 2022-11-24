import 'package:flutter/material.dart';
class HomeScreenSearchBar extends StatefulWidget {
  const HomeScreenSearchBar({Key? key}) : super(key: key);

  @override
  State<HomeScreenSearchBar> createState() => _HomeScreenSearchBarState();
}

class _HomeScreenSearchBarState extends State<HomeScreenSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,

      title:TextFormField(

        decoration: InputDecoration(
          hintText: 'Search',
          border: InputBorder.none
        ),
      ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [



            ],
          ),
        ),
      ),
    );
  }
}
