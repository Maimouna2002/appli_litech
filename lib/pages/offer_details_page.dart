import 'package:flutter/material.dart';
import '../models/offer_model.dart';
import '../widgets/custom_app_bar.dart';

class OfferDetailsPage extends StatelessWidget {
  final Offer offer;

  const OfferDetailsPage({Key? key, required this.offer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Détails de l\'offre',
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        // padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset('assets/images/LOCALISATIONCDTIC.png'),

              //fit: BoxFit.cover,
            ),
            Text(
              offer.description,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Type d\'offre : ${offer.typeOffer?.name ?? ''}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Domaine : ${offer.domain?.name ?? ''}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Date de début : ${offer.dateStart.toString()}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Date de fin : ${offer.dateEnd.toString()}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Places disponibles : ${offer.availablePlaces.toString()}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Statut : ${offer.status}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Niveaux :',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              children: offer.levels
                  .map(
                    (level) => Text(
                      '- ${level.name}',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
