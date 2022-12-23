class PostModel{
  String? title;
  String? desc;
  var price;
  String? location;
  String? brand;
  String? pta;
  String? condtion;
  String? warranty;
  String? ram;
  String? memory;
  String? camera;
  String? battery;
  String? color;
  String? uid;
  String? name;
  String? number;
  bool? whatsAppSwitch;
  String? searchText;
  List<String>? images;
  bool? isShow;
  String? postUid;
  String? favoriteAds;
  String? status;
  List<String>? customerId;

  PostModel({
      this.title,
      this.desc,
      this.price,
      this.location,
      this.brand,
      this.pta,
      this.condtion,
      this.warranty,
      this.ram,
      this.memory,
      this.camera,
      this.battery,
      this.color,
      this.images,
      this.uid,
    this.name,
    this.number,
    this.whatsAppSwitch,
     this.searchText,
    this.isShow,
    this.postUid,
    this.customerId,
    this.favoriteAds,
    this.status

  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'desc': desc,
      'price': price,
      'location': location,
      'brand': brand,
      'pta': pta,
      'condtion': condtion,
      'warranty': warranty,
      'ram': ram,
      'memory': memory,
      'camera': camera,
      'battery': battery,
      'color': color,
      'images': images,
      'uid':uid,
      'name':name,
      'number':number,
      'whatsAppSwitch' :whatsAppSwitch,
      'searchText':searchText,
      'isShow':isShow,
      'postUid':postUid,
      'favoriteAds':favoriteAds,
      'customerId':customerId,
      'status':status
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      title: map['title'] ??'',
      desc: map['desc'] ??'',
      price: map['price'] ??'',
      location: map['location']??'',
      brand: map['brand'] ??'',
      pta: map['pta'] ??'',
      condtion: map['condtion'] ??'',
      warranty: map['warranty'] ??'',
      ram: map['ram'] ??'',
      memory: map['memory'] ??'',
      camera: map['camera'] ??'',
      battery: map['battery'] ??'',
      color: map['color'] ??'',
      uid:map['uid'] ??'',
      name:map['name']??'',
      number:map['number'] ??'',

      whatsAppSwitch: map['whatsAppSwitch']?? false,
      images: map['images']  ??[],
      searchText: map['searchText'] ??'',
        isShow:map['isShow']??false,
       postUid: map['postUid']??'',
        favoriteAds: map['favoriteAds']??'',
        customerId: map['customerId']??'',
      status: map['status']??''
    );
  }
}