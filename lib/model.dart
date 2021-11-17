/// id : "1"
/// img : "adapt-bb-2-basketball-shoe-lgBfBb_1.jpg"
/// name : "Nike Adapt BB 2.0"
/// price : "299.00"
/// mul_img : "adapt-bb-2-basketball-shoe-lgBfBb_1.jpg"
/// sizes : ["40","41","41,5","42","43","44"]

class Model {
  Model({
      String? id, 
      String? img, 
      String? name, 
      String? price, 
      String? mulImg, 
      List<String>? sizes,}){
    _id = id;
    _img = img;
    _name = name;
    _price = price;
    _mulImg = mulImg;
    _sizes = sizes;
}

  Model.fromJson(dynamic json) {
    _id = json['id'];
    _img = json['img'];
    _name = json['name'];
    _price = json['price'];
    _mulImg = json['mul_img'];
    _sizes = json['sizes'] != null ? json['sizes'].cast<String>() : [];
  }
  String? _id;
  String? _img;
  String? _name;
  String? _price;
  String? _mulImg;
  List<String>? _sizes;

  String? get id => _id;
  String? get img => _img;
  String? get name => _name;
  String? get price => _price;
  String? get mulImg => _mulImg;
  List<String>? get sizes => _sizes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['img'] = _img;
    map['name'] = _name;
    map['price'] = _price;
    map['mul_img'] = _mulImg;
    map['sizes'] = _sizes;
    return map;
  }

}