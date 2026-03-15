import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/features/products/domain/entities/product.dart';
import 'package:ecommerce/features/products/domain/repositories/products_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetProducts {
  final ProductsRepository _repository;

  const GetProducts(this._repository);

  Future<Either<Failure, List<Product>>> call({String? categoryId}) =>
      _repository.getProducts(categoryId: categoryId);
}
