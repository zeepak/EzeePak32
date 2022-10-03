import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class Utils{

  void toastMessage(String message){
    Fluttertoast.showToast(
     msg: message,
     toastLength: Toast.LENGTH_SHORT,
     gravity: ToastGravity.CENTER,
     timeInSecForIosWeb: 1,
     backgroundColor: const Color(0xFFFFCD3D),
     textColor: Colors.black,
     fontSize: 16.0,
    );
     
  
     
    
  }
}