class PhoneModel {
  String? uid;

  String? phone;
  
  

  PhoneModel({this.uid, this.phone});

  // receiving data from server
  factory PhoneModel.fromMap(map) {
    return PhoneModel(
      uid: map['uid'],
      
      phone: map['phone'],
      
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      
      'phone': phone,
      
    };
  }
}