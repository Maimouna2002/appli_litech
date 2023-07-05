import 'package:flutter/material.dart';
import 'package:stageapp/models/type_offer_model.dart';
import 'package:stageapp/services/api_type_offer_service.dart';

class TypeOffersScreen extends StatefulWidget {
  const TypeOffersScreen({Key? key}) : super(key: key);

  @override
  _TypeOffersScreenState createState() => _TypeOffersScreenState();
}

class _TypeOffersScreenState extends State<TypeOffersScreen> {
  List<TypeOfferModel> typeOffers = [];
  final ApiTypeOfferService _apiTypeOfferService = ApiTypeOfferService();

  @override
  void initState() {
    super.initState();
    fetchTypeOffers();
  }

  Future<void> fetchTypeOffers() async {
    try {
      List<TypeOfferModel> offers =
          await _apiTypeOfferService.fetchTypeOffers();
      setState(() {
        typeOffers = offers;
      });
    } catch (e) {
      // Gérer l'erreur ici
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Types of Offers'),
      ),
      body: ListView.builder(
        itemCount: typeOffers.length,
        itemBuilder: (context, index) {
          final typeOffer = typeOffers[index];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                title: Text(typeOffer.name),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Logique de partage
                      },
                      child: const Text('Partager'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Logique de postulation
                      },
                      child: const Text('Postuler'),
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
