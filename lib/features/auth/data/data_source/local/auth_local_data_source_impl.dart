import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/errors/exceptions.dart';
import 'package:ecommerce/features/auth/data/data_source/local/auth_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  @override
  Future<void> saveToken(String token) async {
    try {
      final sharedPref = await SharedPreferences.getInstance();
      await sharedPref.setString(CacheKeys.token, token);
    } catch (exception) {
      throw const LocalException('Failed to save token');
    }
  }

  @override
  Future<String> getToken() async {
    try {
      final sharedPref = await SharedPreferences.getInstance();
      return sharedPref.getString(CacheKeys.token)!;
    } catch (exception) {
      throw const LocalException('Failed to get token');
    }
  }
}
