import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/offer_model.dart';

class OfferService {
  Future<List<Offer>> fetchOffers() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8000/api/offers'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      if (jsonData is List) {
        List<Offer> offers = [];
        for (var item in jsonData) {
          // Vérifiez si le statut de l'offre est "publié" avant de l'ajouter à la liste
          if (item['status'] == 'publié') {
            offers.add(Offer.fromJson(item));
          }
        }
        return offers;
      } else {
        throw Exception('Invalid response data format');
      }
    } else if (response.statusCode >= 400 && response.statusCode < 500) {
      throw Exception('Request error: ${response.statusCode}');
    } else if (response.statusCode >= 500) {
      throw Exception('Server error: ${response.statusCode}');
    } else {
      throw Exception('Failed to fetch offers: ${response.statusCode}');
    }
  }

//lstes des offres recentes:
  Future<List<Offer>> fetchRecentOffers() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8000/api/offers'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      if (jsonData is List) {
        List<Offer> offers = [];
        for (var item in jsonData) {
          // Vérifiez si le statut de l'offre est "publié" avant de l'ajouter à la liste
          if (item['status'] == 'publié') {
            offers.add(Offer.fromJson(item));
          }
        }

        // Triez les offres par date de la plus récente à la plus ancienne
        offers.sort((a, b) => b.dateStart.compareTo(a.dateStart));

        // Renvoyer uniquement les 5 premières offres
        return offers.take(5).toList();
      } else {
        throw Exception('Invalid response data format');
      }
    } else if (response.statusCode >= 400 && response.statusCode < 500) {
      throw Exception('Request error: ${response.statusCode}');
    } else if (response.statusCode >= 500) {
      throw Exception('Server error: ${response.statusCode}');
    } else {
      throw Exception('Failed to fetch offers: ${response.statusCode}');
    }
  }

  //list des domaines

  Future<List<Domain>> fetchDomains() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8000/api/offers'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      if (jsonData is List) {
        // Vérification que les données sont bien au format attendu
        List<Domain> domains = [];
        for (var item in jsonData) {
          if (item['domain'] != null) {
            final domainData = item['domain'];
            domains.add(Domain.fromJson(domainData));
          }
        }
        return domains;
      } else {
        throw Exception('Invalid response data format');
      }
    } else if (response.statusCode >= 400 && response.statusCode < 500) {
      // Erreur de requête
      throw Exception('Request error: ${response.statusCode}');
    } else if (response.statusCode >= 500) {
      // Erreur serveur
      throw Exception('Server error: ${response.statusCode}');
    } else {
      // Autres erreurs
      throw Exception('Failed to fetch domains: ${response.statusCode}');
    }
  }

  Future<List<Offer>> fetchDomainOffers(String domain) async {
    final response = await http
        .get(Uri.parse('http://127.0.0.1:8000/api/offers?domain=$domain'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      if (jsonData is List) {
        List<Offer> domainOffers = [];
        for (var item in jsonData) {
          domainOffers.add(Offer.fromJson(item));
        }
        return domainOffers;
      } else {
        throw Exception('Invalid response data format');
      }
    } else if (response.statusCode >= 400 && response.statusCode < 500) {
      throw Exception('Request error: ${response.statusCode}');
    } else if (response.statusCode >= 500) {
      throw Exception('Server error: ${response.statusCode}');
    } else {
      throw Exception('Failed to fetch domain offers: ${response.statusCode}');
    }
  }
}
