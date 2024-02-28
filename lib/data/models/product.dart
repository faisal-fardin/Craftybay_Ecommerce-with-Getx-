import 'package:craftybay_ecommerce/data/models/brand.dart';
import 'package:craftybay_ecommerce/data/models/categoryData.dart';

class Product {
  Product({
    this.id,
    this.title,
    this.shortDes,
    this.price,
    this.discount,
    this.discountPrice,
    this.image,
    this.stock,
    this.star,
    this.remark,
    this.categoryId,
    this.brandId,
    this.createdAt,
    this.updatedAt,
    this.brand,
    this.category,});

  Product.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    shortDes = json['short_des'];
    price = json['price'];
    discount = json['discount'];
    discountPrice = json['discount_price'];
    image = json['image'];
    stock = json['stock'];
    star = json['star'];
    remark = json['remark'];
    categoryId = json['category_id'];
    brandId = json['brand_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    category = json['category'] != null ? CategoryData.fromJson(json['category']) : null;
  }
  num? id;
  String? title;
  String? shortDes;
  String? price;
  num? discount;
  String? discountPrice;
  String? image;
  num? stock;
  num? star;
  String? remark;
  num? categoryId;
  num? brandId;
  String? createdAt;
  String? updatedAt;
  Brand? brand;
  CategoryData? category;
  Product copyWith({  num? id,
    String? title,
    String? shortDes,
    String? price,
    num? discount,
    String? discountPrice,
    String? image,
    num? stock,
    num? star,
    String? remark,
    num? categoryId,
    num? brandId,
    String? createdAt,
    String? updatedAt,
    Brand? brand,
    CategoryData? category,
  }) => Product(  id: id ?? this.id,
    title: title ?? this.title,
    shortDes: shortDes ?? this.shortDes,
    price: price ?? this.price,
    discount: discount ?? this.discount,
    discountPrice: discountPrice ?? this.discountPrice,
    image: image ?? this.image,
    stock: stock ?? this.stock,
    star: star ?? this.star,
    remark: remark ?? this.remark,
    categoryId: categoryId ?? this.categoryId,
    brandId: brandId ?? this.brandId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    brand: brand ?? this.brand,
    category: category ?? this.category,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['short_des'] = shortDes;
    map['price'] = price;
    map['discount'] = discount;
    map['discount_price'] = discountPrice;
    map['image'] = image;
    map['stock'] = stock;
    map['star'] = star;
    map['remark'] = remark;
    map['category_id'] = categoryId;
    map['brand_id'] = brandId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (brand != null) {
      map['brand'] = brand?.toJson();
    }
    if (category != null) {
      map['category'] = category?.toJson();
    }
    return map;
  }

}