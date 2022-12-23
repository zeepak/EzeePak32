import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobihub_2/Screens/main_login.dart';
import 'package:mobihub_2/Screens/navigationscreens.dart/add.dart';

import 'navigationscreens.dart/adds.dart';
import 'navigationscreens.dart/chat.dart';
import 'navigationscreens.dart/home2.dart';
import 'navigationscreens.dart/person.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override

  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {




  final List<Widget> screens = const [
    Home2(),
    Chat(),
    Youradds(),
    Account(),
  ];


  @override
  void initState() {



    super.initState();
  }
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: screens.elementAt(_selectedIndex),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFFDC3D),
        elevation: 2.5,
        onPressed: () {

            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddItems()));



        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    highlightElevation: 0.0,
                    highlightColor: Colors.white,
                    hoverColor: Colors.white,
                    hoverElevation: 0.0,
                    minWidth: 40,
                    onPressed: () {
                      setState(() {

                        _selectedIndex = 0;

                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          color: _selectedIndex == 0
                              ? const Color(0xFFFFDC3D)
                              : Colors.black,
                          size: 25,
                        ),
                        Text(
                          '',
                          style: TextStyle(
                              color: _selectedIndex == 0
                                  ? const Color(0xFFFFDC3D)
                                  : Colors.white),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    highlightElevation: 0.0,
                    highlightColor: Colors.white,
                    hoverColor: Colors.white,
                    hoverElevation: 0.0,
                    minWidth: 40,
                    onPressed: () {
                      setState(() {

                          _selectedIndex = 1;


                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.chat,
                          color: _selectedIndex == 1
                              ? const Color(0xFFFFDC3D)
                              : Colors.black,
                          size: 25,
                        ),
                        Text(
                          '',
                          style: TextStyle(
                              color: _selectedIndex == 1
                                  ? const Color(0xFFFFDC3D)
                                  : Colors.white),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    highlightElevation: 0.0,
                    highlightColor: Colors.white,
                    hoverColor: Colors.white,
                    hoverElevation: 0.0,
                    minWidth: 40,
                    onPressed: () {
                      setState(() {

                          _selectedIndex = 2;


                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite,
                          color: _selectedIndex == 2
                              ? const Color(0xFFFFDC3D)
                              : Colors.black,
                          size: 25,
                        ),
                        Text(
                          '',
                          style: TextStyle(
                              color: _selectedIndex == 2
                                  ? const Color(0xFFFFDC3D)
                                  : Colors.white),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    highlightElevation: 0.0,
                    highlightColor: Colors.white,
                    hoverColor: Colors.white,
                    hoverElevation: 0.0,
                    autofocus: false,
                    minWidth: 40,
                    onPressed: () {
                      setState(() {

                          _selectedIndex = 3;


                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: _selectedIndex == 3
                              ? const Color(0xFFFFDC3D)
                              : Colors.black,
                          size: 25,
                        ),
                        Text(
                          '',
                          style: TextStyle(
                              color: _selectedIndex == 3
                                  ? const Color(0xFFFFDC3D)
                                  : Colors.white),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),

    );
  }
}