import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/data/models/register_request.dart';
import 'package:ecommerce/features/auth/data/repositories/auth_repository.dart';
import 'package:ecommerce/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final _repository = AuthRepository();

  Future<void> register(RegisterRequest request) async {
    emit(RegisterLoading());
    final result = await _repository.register(request);
    result.fold(
      (failure) => emit(RegisterError(failure.message)),
      (_) => emit(RegisterSuccess()),
    );
  }

  Future<void> login(LoginRequest request) async {
    emit(LoginLoading());
    final result = await _repository.login(request);
    result.fold(
      (failure) => emit(LoginError(failure.message)),
      (_) => emit(LoginSuccess()),
    );
  }
}
