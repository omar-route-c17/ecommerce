import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/exceptions.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/features/cart/data/data_sources/remote/cart_remote_data_source.dart';
import 'package:ecommerce/features/cart/data/mappers/cart_mappers.dart';
import 'package:ecommerce/features/cart/domain/entities/cart.dart';
import 'package:ecommerce/features/cart/domain/repositories/cart_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource _remoteDataSource;

  const CartRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, void>> addProduct(String productId) async {
    try {
      await _remoteDataSource.addProduct(productId);
      return const Right(null);
    } on RemoteException catch (exception) {
      return Left(Failure(exception.message));
    }
  }

  @override
  Future<Either<Failure, Cart>> getCart() async {
    try {
      final response = await _remoteDataSource.getCart();
      return Right(response.cart.toEntity);
    } on RemoteException catch (exception) {
      return Left(Failure(exception.message));
    }
  }

  @override
  Future<Either<Failure, Cart>> updateProduct(
    String productId,
    int quantity,
  ) async {
    try {
      final response = await _remoteDataSource.updateProduct(
        productId,
        quantity,
      );
      return Right(response.cart.toEntity);
    } on RemoteException catch (exception) {
      return Left(Failure(exception.message));
    }
  }

  @override
  Future<Either<Failure, Cart>> removeProduct(String productId) async {
    try {
      final response = await _remoteDataSource.removeProduct(productId);
      return Right(response.cart.toEntity);
    } on RemoteException catch (exception) {
      return Left(Failure(exception.message));
    }
  }
}
