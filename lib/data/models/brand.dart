class Brand {
  Brand({
    this.id,
    this.brandName,
    this.brandImg,
    this.createdAt,
    this.updatedAt,});

  Brand.fromJson(dynamic json) {
    id = json['id'];
    brandName = json['brandName'];
    brandImg = json['brandImg'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? brandName;
  String? brandImg;
  String? createdAt;
  String? updatedAt;
  Brand copyWith({  num? id,
    String? brandName,
    String? brandImg,
    String? createdAt,
    String? updatedAt,
  }) => Brand(  id: id ?? this.id,
    brandName: brandName ?? this.brandName,
    brandImg: brandImg ?? this.brandImg,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['brandName'] = brandName;
    map['brandImg'] = brandImg;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}