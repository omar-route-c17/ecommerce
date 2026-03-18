import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/features/cart/domain/entities/cart.dart';
import 'package:ecommerce/features/cart/domain/repositories/cart_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RemoveProductFromCart {
  final CartRepository _repository;

  const RemoveProductFromCart(this._repository);

  Future<Either<Failure, Cart>> call(String productId) =>
      _repository.removeProduct(productId);
}
