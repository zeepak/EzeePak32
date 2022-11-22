class PostModel{
  String? title;
  String? desc;
  String? price;
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
  List<String>? images;

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
      this.uid

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
      'uid':uid
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      title: map['title'] as String,
      desc: map['desc'] as String,
      price: map['price'] as String,
      location: map['location'] as String,
      brand: map['brand'] as String,
      pta: map['pta'] as String,
      condtion: map['condtion'] as String,
      warranty: map['warranty'] as String,
      ram: map['ram'] as String,
      memory: map['memory'] as String,
      camera: map['camera'] as String,
      battery: map['battery'] as String,
      color: map['color'] as String,
      uid:map['uid'] as String,
      images: map['images'] as List<String>?,
    );
  }
}