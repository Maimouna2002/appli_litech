import 'package:http/http.dart' as http;
import 'dart:convert';

import '../constants.dart';

class ApiAuthService {
  static Future<void> register(String name, String email, String password) async {
    final response = await http.post(
      Uri.parse(ApiConstants.baseUrl + ApiConstants.registerEndpoint),
      body: {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': password,
      },
    );

    if (response.statusCode == 201) {
      // Succès de l'enregistrement de l'utilisateur
    } else {
      final errorMessage = json.decode(response.body)['error'];
      throw Exception(errorMessage);
    }
  }

  static Future<String?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse(ApiConstants.baseUrl + ApiConstants.loginEndpoint),
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return responseData['access_token'];
    } else {
      final errorMessage = json.decode(response.body)['message'];
      throw Exception(errorMessage);
    }
  }

  static Future<void> logout(String token) async {
    final response = await http.get(
      Uri.parse(ApiConstants.baseUrl + ApiConstants.logoutEndpoint),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      // Succès de la déconnexion
    } else {
      final errorMessage = json.decode(response.body)['message'];
      throw Exception(errorMessage);
    }
  }
}
