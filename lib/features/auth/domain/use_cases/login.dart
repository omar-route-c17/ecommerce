import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/domain/entities/user.dart';
import 'package:ecommerce/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class Login {
  final AuthRepository _repository;

  const Login(this._repository);

  Future<Either<Failure, User>> call(LoginRequest request) =>
      _repository.login(request);
}
