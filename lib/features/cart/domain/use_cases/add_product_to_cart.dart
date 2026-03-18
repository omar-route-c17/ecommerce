import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/features/cart/domain/repositories/cart_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddProductToCart {
  final CartRepository _repository;

  const AddProductToCart(this._repository);

  Future<Either<Failure, void>> call(String productId) =>
      _repository.addProduct(productId);
}
