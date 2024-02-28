import 'package:craftybay_ecommerce/data/models/categoryData.dart';

class CategoryModel {
  CategoryModel({
      this.msg, 
      this.data,});

  CategoryModel.fromJson(dynamic json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CategoryData.fromJson(v));
      });
    }
  }
  String? msg;
  List<CategoryData>? data;
CategoryModel copyWith({  String? msg,
  List<CategoryData>? data,
}) => CategoryModel(  msg: msg ?? this.msg,
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

