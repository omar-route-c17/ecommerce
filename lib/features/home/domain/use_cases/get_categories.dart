import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/features/home/domain/entities/category.dart';
import 'package:ecommerce/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCategories {
  final HomeRepository _repository;

  const GetCategories(this._repository);

  Future<Either<Failure, List<Category>>> call() => _repository.getCategories();
}
