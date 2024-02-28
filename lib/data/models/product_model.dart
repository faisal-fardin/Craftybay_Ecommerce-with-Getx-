import 'package:craftybay_ecommerce/data/models/product.dart';

class ProductModel {
  ProductModel({
    this.msg,
    this.data,
  });

  ProductModel.fromJson(dynamic json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Product.fromJson(v));
      });
    }
  }

  String? msg;
  List<Product>? data;

  ProductModel copyWith({
    String? msg,
    List<Product>? data,
  }) =>
      ProductModel(
        msg: msg ?? this.msg,
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
