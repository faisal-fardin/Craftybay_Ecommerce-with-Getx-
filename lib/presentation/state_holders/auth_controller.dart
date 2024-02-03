
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  static String? _accessToken;

  String? get accessToken => _accessToken;

  static Future<void> setAccessToken(String token) async {
     final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
     await sharedPreferences.setString('accessToken', token);
     _accessToken = token;
   }

  static Future<void> getAccessToken() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _accessToken =  sharedPreferences.getString('accessToken');
  }

  static bool get isLoginIn{
     return _accessToken != null;
  }

}