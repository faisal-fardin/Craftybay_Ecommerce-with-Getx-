import 'package:craftybay_ecommerce/data/models/product_details.dart';

class ProductDetailsModel {
  ProductDetailsModel({
      String? msg, 
      List<ProductDetails>? data,}){
    _msg = msg;
    _data = data;
}

  ProductDetailsModel.fromJson(dynamic json) {
    _msg = json['msg'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(ProductDetails.fromJson(v));
      });
    }
  }
  String? _msg;
  List<ProductDetails>? _data;
ProductDetailsModel copyWith({  String? msg,
  List<ProductDetails>? data,
}) => ProductDetailsModel(  msg: msg ?? _msg,
  data: data ?? _data,
);
  String? get msg => _msg;
  List<ProductDetails>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['msg'] = _msg;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}







