import 'package:http/http.dart' as http;
import 'dart:convert';

import '../constants.dart';
import '../models/type_offer_model.dart';

class ApiTypeOfferService {
  Future<List<TypeOfferModel>> fetchTypeOffers() async {
    try {
      final response = await http.get(Uri.parse(ApiConstants.baseUrl + ApiConstants.typeOffersEndpoint));

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        return responseData.map((json) => TypeOfferModel.fromJson(json)).toList();
      } else {
        _log('Échec de la récupération des types d\'offres. Code d\'état : ${response.statusCode}');
        throw Exception('Échec de la récupération des types d\'offres');
      }
    } catch (e) {
      _log('Une erreur s\'est produite lors de la récupération des types d\'offres : $e');
      throw Exception('Échec de la récupération des types d\'offres');
    }
  }

  void _log(String message) {
    print('[${DateTime.now().toIso8601String()}] $message');
  }
}
