class SliderModel {
  SliderModel({
      this.msg, 
      this.data,});

  SliderModel.fromJson(dynamic json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(SliderData.fromJson(v));
      });
    }
  }
  String? msg;
  List<SliderData>? data;
SliderModel copyWith({  String? msg,
  List<SliderData>? data,
}) => SliderModel(  msg: msg ?? this.msg,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['msg'] = msg;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class SliderData {
  SliderData({
      this.id, 
      this.title, 
      this.shortDes, 
      this.image, 
      this.productId, 
      this.createdAt, 
      this.updatedAt,});

  SliderData.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    shortDes = json['short_des'];
    image = json['image'];
    productId = json['product_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? title;
  String? shortDes;
  String? image;
  num? productId;
  String? createdAt;
  String? updatedAt;
SliderData copyWith({  num? id,
  String? title,
  String? shortDes,
  String? image,
  num? productId,
  String? createdAt,
  String? updatedAt,
}) => SliderData(  id: id ?? this.id,
  title: title ?? this.title,
  shortDes: shortDes ?? this.shortDes,
  image: image ?? this.image,
  productId: productId ?? this.productId,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['short_des'] = shortDes;
    map['image'] = image;
    map['product_id'] = productId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}