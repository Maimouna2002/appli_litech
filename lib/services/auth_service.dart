import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final String apiUrl = 'http://127.0.0.1:8000/api/auth';
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  Future<bool> register(String name, String email, String password) async {
    final url = Uri.parse('$apiUrl/register');

    try {
      final response = await http.post(url, body: {
        'name': name,
        'email': email,
        'password': password,
        'c_password': password,
      });

      if (response.statusCode == 201) {
        // Gérer le succès de l'inscription
        return true;
      } else {
        // Gérer les erreurs de l'inscription
        return false;
      }
    } catch (error) {
      // Gérer les erreurs de connexion
      return false;
    }
  }

  Future<bool> login(String email, String password) async {
    final url = Uri.parse('$apiUrl/login');

    try {
      final response = await http.post(url, body: {
        'email': email,
        'password': password,
        'remember_me': true.toString(),
      });

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        final accessToken = data['access_token'];

        // Gérer le succès de la connexion
        await storeAccessToken(accessToken);

        return true;
      } else {
        // Gérer les erreurs de la connexion
        return false;
      }
    } catch (error) {
      // Gérer les erreurs de connexion
      return false;
    }
  }

  Future<void> logout() async {
    final token = await getAccessToken();

    if (token != null) {
      final url = Uri.parse('$apiUrl/logout');

      try {
        final response = await http.post(
          url,
          headers: {'Authorization': 'Bearer $token'},
        );

        if (response.statusCode == 200) {
          // Gérer la déconnexion avec succès
          await removeAccessToken();
        } else {
          // Gérer les erreurs de déconnexion
        }
      } catch (error) {
        // Gérer les erreurs de connexion
      }
    }
  }

  Future<void> storeAccessToken(String token) async {
    await secureStorage.write(key: 'access_token', value: token);
  }

  Future<String?> getAccessToken() async {
    return await secureStorage.read(key: 'access_token');
  }

  Future<void> removeAccessToken() async {
    await secureStorage.delete(key: 'access_token');
  }
}
