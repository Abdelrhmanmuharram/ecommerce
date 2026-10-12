import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/data/models/register_request.dart';
import 'package:ecommerce/features/auth/data/repositories/auth_repository.dart';
import 'package:ecommerce/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final _repository = AuthRepository();

  Future<void> register(RegisterRequest request) async {
    try {
      emit(RegisterLoading());
      await _repository.register(request);
      emit(RegisterSuccess());
    } catch (error) {
      emit(RegisterError(error.toString()));
    }
  }

  Future<void> login(LoginRequest request) async {
    try {
      emit(LoginLoading());
      await _repository.login(request);
      emit(LoginSuccess());
    } catch (error) {
      emit(LoginError(error.toString()));
    }
  }
}
