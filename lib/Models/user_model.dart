class UserModel {
  String? uid;
  String? email;
  String? fullName;
  String? phone;
  String? location;
 String? gender;
String? joindate;
  

  UserModel({this.uid, this.email, this.fullName, this.phone, this.location, this.gender, this.joindate});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid']?? '',
      email: map['email'] ?? '',
      fullName: map['fullName']?? '',
      phone: map['phone'] ?? '',
      location: map['location']?? '',
      gender: map['gender']??'',
      joindate: map['joindate']??'',
      
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'fullName': fullName,
      'phone' : phone,
      'location' : location,
      'gender' : gender,
      'joindate' : joindate,
      
    };
  }
  
}