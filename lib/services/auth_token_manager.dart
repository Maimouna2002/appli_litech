import 'package:shared_preferences/shared_preferences.dart';

class AuthTokenManager {
  static const String _accessTokenKey = 'access_token';

  static Future<void> setAccessToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_accessTokenKey, token);
  }

  static Future<String> getAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? accessToken = prefs.getString(_accessTokenKey);
    return accessToken ??
        ''; // Use an empty string as the default value if accessToken is null
  }

  static Future<void> removeAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_accessTokenKey);
  }
}
