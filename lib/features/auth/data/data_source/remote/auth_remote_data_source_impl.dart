import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/data/models/login_response.dart';
import 'package:ecommerce/features/auth/data/models/register_request.dart';
import 'package:ecommerce/features/auth/data/models/register_response.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio _dio = Dio(BaseOptions(baseUrl: APIConstants.baseUrl));

  @override
  Future<RegisterResponse> register(RegisterRequest request) async {
    final response = await _dio.post(
      APIConstants.registerEndpoint,
      data: request.toJson(),
    );
    return RegisterResponse.fromJson(response.data);
  }

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    final response = await _dio.post(
      APIConstants.loginEndpoint,
      data: request.toJson(),
    );
    return LoginResponse.fromJson(response.data);
  }
}
