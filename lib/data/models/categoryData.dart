class CategoryData {
  CategoryData({
    this.id,
    this.categoryName,
    this.categoryImg,
    this.createdAt,
    this.updatedAt,});

  CategoryData.fromJson(dynamic json) {
    id = json['id'];
    categoryName = json['categoryName'];
    categoryImg = json['categoryImg'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? categoryName;
  String? categoryImg;
  String? createdAt;
  String? updatedAt;
  CategoryData copyWith({  num? id,
    String? categoryName,
    String? categoryImg,
    String? createdAt,
    String? updatedAt,
  }) => CategoryData(  id: id ?? this.id,
    categoryName: categoryName ?? this.categoryName,
    categoryImg: categoryImg ?? this.categoryImg,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['categoryName'] = categoryName;
    map['categoryImg'] = categoryImg;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}