import 'package:dio/dio.dart';
import 'package:mel_store/core/network/dio_client.dart';

import '../models/product_model.dart';
import 'api_service.dart';

class ApiServiceImpl implements ApiService {
  final Dio dio = ApiClient.dio;

  @override
  Future<List<ProductModel>> getProducts() async {
    List<ProductModel> products = [];
    try {
      final res = await dio.get('/beers');
      if (res.statusCode == 200) {
        if (res.data != null && (res.data as Iterable).isNotEmpty) {
          final data = res.data as Iterable;
          products.addAll(data.map((e) => ProductModel.fromJson(e)).toList());
        }
      }
    } catch (e) {
      rethrow;
    }
    return products;
  }
}
