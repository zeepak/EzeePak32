import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFDC3D),
        title: const Text(
          'Profile',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            const Padding(
              padding: EdgeInsets.only(top: 70,left: 10),
              child: Text('Edit Profile', style: TextStyle(fontFamily: 'Lato',fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),),
            ),
            const SizedBox(height: 20,),
            const Center(
              child: CircleAvatar(
                    backgroundColor: Colors.black26,
                    radius: 40,
                    backgroundImage: AssetImage('assets/icons/user.png'),
                  ),
            ),
            const SizedBox(height: 10,),
            
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
              children: [
                SizedBox(
                  width: 100,
                  height: 40,
                  child: ElevatedButton(
                    
                    onPressed: (){},
                    style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all( Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(
                  color: Colors.black,
                  width: 1,
              ),
            ),
          ),
        ), 
                    child: const Text('CANCEL',style: TextStyle(color: Colors.black),)
                    ),
                ),
                SizedBox(
                  width: 100,
                  height: 40,
                  child: ElevatedButton(
                    
                    onPressed: (){},
                    style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(const Color(0xFFFFDC3D)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(
                  color: Colors.transparent,
                  width: 1,
              ),
            ),
          ),
        ), 
                    child: const Text('SAVE',style: TextStyle(color: Colors.black),)
                    ),
                ),
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}