import 'package:http/http.dart' as http;
import 'dart:convert';

import '../constants.dart';
import '../models/offer_model.dart';

class OfferService {
  Future<List<Offer>> fetchOffers() async {
    try {
      final response = await http
          .get(Uri.parse(ApiConstants.baseUrl + ApiConstants.offersEndpoint));

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        return responseData.map((json) => Offer.fromJson(json)).toList();
      } else {
        _log(
            'Échec de la récupération des offres. Code d\'état : ${response.statusCode}');
        throw Exception('Échec de la récupération des offres');
      }
    } catch (e) {
      _log(
          'Une erreur s\'est produite lors de la récupération des offres : $e');
      throw Exception('Échec de la récupération des offres');
    }
  }

  void _log(String message) {
    print('[${DateTime.now().toIso8601String()}] $message');
  }
}
