// offer_service.dart
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/offer_model.dart';

class OfferService {
  OfferService(String s);

  Future<List<Offer>> fetchOffers() async {
    final response = await http.get('http://127.0.0.1:8000/api/offers' as Uri);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      List<Offer> offers = [];
      for (var item in jsonData) {
        offers.add(Offer.fromJson(item));
      }
      return offers;
    } else {
      throw Exception('Failed to fetch offers');
    }
  }
}
