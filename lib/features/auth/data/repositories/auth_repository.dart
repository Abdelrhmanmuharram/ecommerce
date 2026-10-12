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

  Future<UserModel> register(RegisterRequest request) async {
    final response = await _remoteDataSource.register(request);
    await _localDataSource.saveToken(response.token);
    return response.user;
  }

  Future<UserModel> login(LoginRequest request) async {
    final response = await _remoteDataSource.login(request);
    await _localDataSource.saveToken(response.token);
    return response.user;
  }
}
