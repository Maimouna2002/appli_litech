import 'package:flutter/material.dart';

import '../models/offer_model.dart';

class CustomOfferCard extends StatelessWidget {
  final Offer offer;
  final VoidCallback onApply;
  final VoidCallback onViewDetails;

  const CustomOfferCard({
    Key? key,
    required this.offer,
    required this.onApply,
    required this.onViewDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(offer.description),
        subtitle: Text(offer.typeOffer?.name ?? 'Type d\'offre inconnu'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: onApply,
              child: Text('Postuler'),
            ),
            TextButton(
              onPressed: onViewDetails,
              child: Text('Voir plus'),
            ),
          ],
        ),
      ),
    );
  }
}
