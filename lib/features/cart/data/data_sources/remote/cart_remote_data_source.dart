import 'package:ecommerce/features/cart/data/models/cart_response.dart';

abstract class CartRemoteDataSource {
  Future<void> addProduct(String productId);

  Future<CartResponse> getCart();

  Future<CartResponse> updateProduct(String productId, int quantity);

  Future<CartResponse> removeProduct(String productId);
}
