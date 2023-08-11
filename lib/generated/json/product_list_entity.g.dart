import 'package:block_example/generated/json/base/json_convert_content.dart';
import 'package:block_example/products/response/product_list_entity.dart';

ProductListEntity $ProductListEntityFromJson(Map<String, dynamic> json) {
	final ProductListEntity productListEntity = ProductListEntity();
	final double? id = jsonConvert.convert<double>(json['id']);
	if (id != null) {
		productListEntity.id = id;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		productListEntity.title = title;
	}
	final double? price = jsonConvert.convert<double>(json['price']);
	if (price != null) {
		productListEntity.price = price;
	}
	final String? description = jsonConvert.convert<String>(json['description']);
	if (description != null) {
		productListEntity.description = description;
	}
	final String? category = jsonConvert.convert<String>(json['category']);
	if (category != null) {
		productListEntity.category = category;
	}
	final String? image = jsonConvert.convert<String>(json['image']);
	if (image != null) {
		productListEntity.image = image;
	}
	final ProductListRating? rating = jsonConvert.convert<ProductListRating>(json['rating']);
	if (rating != null) {
		productListEntity.rating = rating;
	}
	return productListEntity;
}

Map<String, dynamic> $ProductListEntityToJson(ProductListEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['title'] = entity.title;
	data['price'] = entity.price;
	data['description'] = entity.description;
	data['category'] = entity.category;
	data['image'] = entity.image;
	data['rating'] = entity.rating?.toJson();
	return data;
}

ProductListRating $ProductListRatingFromJson(Map<String, dynamic> json) {
	final ProductListRating productListRating = ProductListRating();
	final double? rate = jsonConvert.convert<double>(json['rate']);
	if (rate != null) {
		productListRating.rate = rate;
	}
	final double? count = jsonConvert.convert<double>(json['count']);
	if (count != null) {
		productListRating.count = count;
	}
	return productListRating;
}

Map<String, dynamic> $ProductListRatingToJson(ProductListRating entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['rate'] = entity.rate;
	data['count'] = entity.count;
	return data;
}