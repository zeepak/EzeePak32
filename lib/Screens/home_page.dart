

import 'package:firebase_auth/firebase_auth.dart';
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
  final auth = FirebaseAuth.instance;
  
  
  int currentTab = 0;
  final List<Widget> screens = const [
    Home2(),
    Chat(),
    Youradds(),
    Account(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const Home2();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFFDC3D),
        elevation: 2.5,
        onPressed: () {
   if(FirebaseAuth.instance.currentUser != null){
     Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddItems()));
   }else{
     Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainLogin()));
   }
          
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
                         currentScreen = const Home2();
                        currentTab = 0;
                        
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          color: currentTab == 0
                              ? const Color(0xFFFFDC3D)
                              : Colors.black,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                              color: currentTab == 0
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
                        if(FirebaseAuth.instance.currentUser != null){
                           currentScreen = const Chat();
                        currentTab = 1;
                        }else{
                           Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainLogin()));
                        }
                        
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.chat,
                          color: currentTab == 1
                              ? const Color(0xFFFFDC3D)
                              : Colors.black,
                        ),
                        Text(
                          'Chat',
                          style: TextStyle(
                              color: currentTab == 1
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
                        if(FirebaseAuth.instance.currentUser != null){
                           currentScreen = const Youradds();
                        currentTab = 2;
                        }else{
                           Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainLogin()));
                        }
                        
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite,
                          color: currentTab == 2
                              ? const Color(0xFFFFDC3D)
                              : Colors.black,
                        ),
                        Text(
                          'Ads',
                          style: TextStyle(
                              color: currentTab == 2
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
                        if(FirebaseAuth.instance.currentUser != null){
                          currentScreen = const Account();
                        currentTab = 3;
                        }else{
                           Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainLogin()));
                        }
                        
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: currentTab == 3
                              ? const Color(0xFFFFDC3D)
                              : Colors.black,
                        ),
                        Text(
                          'Account',
                          style: TextStyle(
                              color: currentTab == 3
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
