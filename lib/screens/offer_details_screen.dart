import 'package:flutter/material.dart';
import 'package:stageapp/models/offer_model.dart';

class OfferDetailsScreen extends StatelessWidget {
  final Offer offer;

  const OfferDetailsScreen({Key? key, required this.offer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offer Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              offer.description,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text('Date Start: ${offer.dateStart.toString()}'),
            Text('Date End: ${offer.dateEnd.toString()}'),
            Text('Available Places: ${offer.availablePlaces.toString()}'),
            Text('Status: ${offer.status}'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Logic for applying
              },
              child: const Text('Apply'),
            ),
          ],
        ),
      ),
    );
  }
}
