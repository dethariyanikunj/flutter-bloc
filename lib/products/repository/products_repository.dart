import 'package:block_example/generated/json/base/json_convert_content.dart';
import 'package:block_example/products/network/api.dart';
import 'package:block_example/products/response/product_list_entity.dart';
import 'package:dio/dio.dart';

class ProductsRepository {
  Future<List<ProductListEntity>?> fetchProducts() async {
    try {
      final response = await Api().apiRequest.get('/products');
      if (response.statusCode == 200) {
        final data = response.data;
        return JsonConvert.fromJsonAsT<List<ProductListEntity>>(data);
      }
      return null;
    } on DioException catch (_) {
      return null;
    }
  }
}
