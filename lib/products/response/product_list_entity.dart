import 'package:block_example/generated/json/base/json_field.dart';
import 'package:block_example/generated/json/product_list_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ProductListEntity {

	double? id;
	String? title;
	double? price;
	String? description;
	String? category;
	String? image;
	ProductListRating? rating;
  
  ProductListEntity();

  factory ProductListEntity.fromJson(Map<String, dynamic> json) => $ProductListEntityFromJson(json);

  Map<String, dynamic> toJson() => $ProductListEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ProductListRating {

	double? rate;
	double? count;
  
  ProductListRating();

  factory ProductListRating.fromJson(Map<String, dynamic> json) => $ProductListRatingFromJson(json);

  Map<String, dynamic> toJson() => $ProductListRatingToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}