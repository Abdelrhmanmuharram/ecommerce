import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/exceptions.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/features/auth/data/data_source/local/auth_local_data_source.dart';
import 'package:ecommerce/features/auth/data/data_source/local/auth_local_data_source_impl.dart';
import 'package:ecommerce/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:ecommerce/features/auth/data/data_source/remote/auth_remote_data_source_impl.dart';
import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/data/models/register_request.dart';
import 'package:ecommerce/features/auth/data/models/user_model.dart';

class AuthRepository {
  final AuthRemoteDataSource _remoteDataSource = AuthRemoteDataSourceImpl();
  final AuthLocalDataSource _localDataSource = AuthLocalDataSourceImpl();

  Future<Either<Failure, UserModel>> register(RegisterRequest request) async {
    try {
      final response = await _remoteDataSource.register(request);
      await _localDataSource.saveToken(response.token);
      return Right(response.user);
    } on AppException catch (exception) {
      return Left(Failure(exception.message));
    }
  }

  Future<Either<Failure, UserModel>> login(LoginRequest request) async {
    try {
      final response = await _remoteDataSource.login(request);
      await _localDataSource.saveToken(response.token);
      return Right(response.user);
    } on AppException catch (exception) {
      return Left(Failure(exception.message));
    }
  }
}
