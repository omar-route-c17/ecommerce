import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/features/cart/domain/entities/cart.dart';

abstract class CartRepository {
  Future<Either<Failure, void>> addProduct(String productId);

  Future<Either<Failure, Cart>> getCart();

  Future<Either<Failure, Cart>> updateProduct(String productId, int quantity);

  Future<Either<Failure, Cart>> removeProduct(String productId);
}
