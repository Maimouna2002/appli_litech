import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/auth_model.dart';
import '../models/application_model.dart';

class ApplicationService {
  Future<Application> apply(String token, Application application) async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/api/applications'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: json.encode(application.toJson()),
    );

    if (response.statusCode == 201) {
      final jsonData = json.decode(response.body);

      if (jsonData is Map<String, dynamic>) {
        return Application.fromJson(jsonData);
      } else {
        throw Exception('Invalid response data format');
      }
    } else if (response.statusCode == 401) {
      throw Exception('Unauthorized');
    } else {
      throw Exception('Failed to apply: ${response.statusCode}');
    }
  }
}
