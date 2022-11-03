import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../main_login.dart';


class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
   bool loading = false;
   String? fullName = '';
   String? uid = '';
   
  Future _getDataFromDatabase()async{
  await FirebaseFirestore.instance.collection("UsersDetails").doc(FirebaseAuth.instance.currentUser!.uid).get().then((snapshot)async{
   if(snapshot.exists && snapshot.get('fullName') != null){
    setState(() {
      fullName = snapshot.data()!['fullName'];
      uid = snapshot.data()!['uid'];
    });
   }else{
    setState(() {
      uid = snapshot.data()!['uid'];
    loading = true;
    });
   }
   
   
    
   
  });
  }
  @override
  void initState() {
    super.initState();
    _getDataFromDatabase();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children:  [
                 const CircleAvatar(
                  backgroundColor: Colors.black26,
                  radius: 30,
                  backgroundImage: AssetImage('assets/icons/user.png'),
                ),
                const SizedBox(
                  width: 20,
                ),
                
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: loading?  Text(

                    uid!,
                    style:  const TextStyle(
                      fontSize: 15,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                    ),
                  ) : Text(fullName!,style:  const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                    ),)
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            
          Padding(  
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),  
      child:Container(  
        decoration: BoxDecoration(  
          border: Border(bottom: BorderSide(color: Colors.grey.shade400))  
        ),  
      child: InkWell(  
        splashColor: Colors.grey,  
        onTap: (){
             
        },  
        child: SizedBox(  
          height: 40,  
          child: Row(  
            mainAxisAlignment : MainAxisAlignment.spaceBetween,  
            children: <Widget> [  
            Row(children: const <Widget> [  
             Icon(Icons.person) , 
            Padding(  
              padding: EdgeInsets.all(8.0),  
            ),  
            Text('Profile', style: TextStyle(  
              fontSize: 16  
            ),),  
          ],),  
        const Icon(Icons.arrow_right)  
      ],)  
        )   
    ),  
    ),  
    ), 
    const SizedBox(height: 15,),
    Padding(  
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),  
      child:Container(  
        decoration: BoxDecoration(  
          border: Border(bottom: BorderSide(color: Colors.grey.shade400))  
        ),  
      child: InkWell(  
        splashColor: Colors.grey,  
        onTap: (){
          
        },  
        child: SizedBox(  
          height: 40,  
          child: Row(  
            mainAxisAlignment : MainAxisAlignment.spaceBetween,  
            children: <Widget> [  
            Row(children: const <Widget> [  
             Icon(Icons.notifications) , 
            Padding(  
              padding: EdgeInsets.all(8.0),  
            ),  
            Text('Notification', style: TextStyle(  
              fontSize: 16  
            ),),  
          ],),  
        const Icon(Icons.arrow_right)  
      ],)  
        )   
    ),  
    ),  
    ), 
   
    const  SizedBox(height: 15,),
   Padding(  
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),  
      child:Container(  
        decoration: BoxDecoration(  
          border: Border(bottom: BorderSide(color: Colors.grey.shade400))  
        ),  
      child: InkWell(  
        splashColor: Colors.grey,  
        onTap: (){
          
        },  
        child: SizedBox(  
          height: 40,  
          child: Row(  
            mainAxisAlignment : MainAxisAlignment.spaceBetween,  
            children: <Widget> [  
            Row(children: const <Widget> [  
             Icon(Icons.favorite) , 
            Padding(  
              padding: EdgeInsets.all(8.0),  
            ),  
            Text('Favourit Ads', style: TextStyle(  
              fontSize: 16  
            ),),  
          ],),  
        const Icon(Icons.arrow_right)  
      ],)  
        )   
    ),  
    ),  
    ), 
    const  SizedBox(height: 15,),
   Padding(  
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),  
      child:Container(  
        decoration: BoxDecoration(  
          border: Border(bottom: BorderSide(color: Colors.grey.shade400))  
        ),  
      child: InkWell(  
        splashColor: Colors.grey,  
        onTap: (){
          
        },  
        child: SizedBox(  
          height: 40,  
          child: Row(  
            mainAxisAlignment : MainAxisAlignment.spaceBetween,  
            children: <Widget> [  
            Row(children: const <Widget> [  
             Icon(Icons.contacts) , 
            Padding(  
              padding: EdgeInsets.all(8.0),  
            ),  
            Text('Contact Us', style: TextStyle(  
              fontSize: 16  
            ),),  
          ],),  
        const Icon(Icons.arrow_right)  
      ],)  
        )   
    ),  
    ),  
    ), 
    const SizedBox(height: 15,),
    Padding(  
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),  
      child:Container(  
        decoration: BoxDecoration(  
          border: Border(bottom: BorderSide(color: Colors.grey.shade400))  
        ),  
      child: InkWell(  
        splashColor: Colors.grey,  
        onTap: ()async{
           await FirebaseAuth.instance.signOut();
               //userEmail = "";
              await GoogleSignIn().signOut();
              setState(() {
              Navigator.pushAndRemoveUntil(
                  (context),
                  MaterialPageRoute(builder: (context) =>  MainLogin()),
                  (route) => false);
              });
        },  
        child: SizedBox(  
          height: 40,  
          child: Row(  
            mainAxisAlignment : MainAxisAlignment.spaceBetween,  
            children: <Widget> [  
            Row(children: const <Widget> [  
             Icon(Icons.logout,color: Colors.red,) , 
            Padding(  
              padding: EdgeInsets.all(8.0),  
            ),  
            Text('Logout', style: TextStyle(  
              fontSize: 16 , color: Colors.red

            ),),  
          ],),  
        
      ],)  
        )   
    ),  
    ),  
    ), 
            
            
            
          ],
        ),
      ),
    );
  }
}

