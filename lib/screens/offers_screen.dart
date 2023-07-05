import 'package:flutter/material.dart';
import '../models/offer_model.dart';
import '../services/offer_service.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({Key? key}) : super(key: key);

  @override
  _OffersScreenState createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  List<Offer> offers = [];
  final OfferService offerService =
      OfferService('http://127.0.0.1:8000/api/offres');

  @override
  void initState() {
    super.initState();
    fetchOffers();
  }

  Future<void> fetchOffers() async {
    try {
      List<Offer> fetchedOffers = await offerService.fetchOffers();
      setState(() {
        offers = fetchedOffers;
      });
    } catch (e) {
      // Gérer l'erreur ici
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offres de stage'),
      ),
      body: ListView.builder(
        itemCount: offers.length,
        itemBuilder: (context, index) {
          final offer = offers[index];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                title: Text(offer.description),
                subtitle: Text('Places disponibles : ${offer.availablePlaces}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Logique du bouton "Postuler"
                      },
                      child: const Text('Postuler'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Logique du bouton "Voir plus"
                      },
                      child: const Text('Voir plus'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
