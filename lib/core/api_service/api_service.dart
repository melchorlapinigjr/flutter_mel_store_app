import '../models/product_model.dart';

abstract class ApiService {
  Future<List<ProductModel>> getProducts();
}
