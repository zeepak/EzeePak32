import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;
User get user => _auth.currentUser!;
Future<bool> signInWithGoogle() async {
  bool result = false;
  String? location;
 String? gender;
 String? joindate;
  
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

   
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    
UserCredential userCredential =
           
          await _auth.signInWithCredential(credential);
      User? user = userCredential.user;

      if (user != null) {
        
        if (userCredential.additionalUserInfo!.isNewUser) {
          // add the data to fire base
          await _firestore.collection('UsersDetails').doc(user.uid).set(
            {
              'fullName' : user.displayName,
              'uid' : user.uid,
              'Location' : location,
              'Gender' : gender,
              'email' : user.email,
              'phone' : user.phoneNumber,
              'Join Date' : joindate,
            }
          );

        }
        result = true;
      }
      return result;
 }
   
    //return await FirebaseAuth.instance.signInWithCredential(credential);
  