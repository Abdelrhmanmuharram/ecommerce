// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:dio/dio.dart' as _i361;
import 'package:ecommerce/core/di/register_module.dart' as _i709;
import 'package:ecommerce/features/auth/data/data_source/local/auth_local_data_source.dart'
    as _i350;
import 'package:ecommerce/features/auth/data/data_source/local/auth_local_data_source_impl.dart'
    as _i474;
import 'package:ecommerce/features/auth/data/data_source/remote/auth_remote_data_source.dart'
    as _i1063;
import 'package:ecommerce/features/auth/data/data_source/remote/auth_remote_data_source_impl.dart'
    as _i546;
import 'package:ecommerce/features/auth/data/repositories/auth_repository.dart'
    as _i177;
import 'package:ecommerce/features/auth/presentation/cubit/auth_cubit.dart'
    as _i351;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio());
    gh.singleton<_i1063.AuthRemoteDataSource>(
      () => _i546.AuthRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.singleton<_i350.AuthLocalDataSource>(
      () => _i474.AuthLocalDataSourceImpl(gh<_i460.SharedPreferences>()),
    );
    gh.singleton<_i177.AuthRepository>(
      () => _i177.AuthRepository(
        gh<_i350.AuthLocalDataSource>(),
        gh<_i1063.AuthRemoteDataSource>(),
      ),
    );
    gh.singleton<_i351.AuthCubit>(
      () => _i351.AuthCubit(gh<_i177.AuthRepository>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i709.RegisterModule {}
