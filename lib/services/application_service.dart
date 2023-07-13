import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/application_model.dart';

class ApplicationService {
  Future<bool> submitApplication(Application application) async {
    final url =
        'http://127.0.0.1:8000/api/applications'; // Remplacez par l'URL de votre API
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode(application.toJson());

    final response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 200) {
      // La candidature a été soumise avec succès
      return true;
    } else {
      // La candidature n'a pas pu être soumise
      return false;
    }
  }
}
