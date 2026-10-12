import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/features/auth/data/data_source/local/auth_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  @override
  Future<void> saveToken(String token) async {
    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.setString(CacheKeys.token, token);
  }

  @override
  Future<String> getToken() async {
    final sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getString(CacheKeys.token)!;
  }
}
