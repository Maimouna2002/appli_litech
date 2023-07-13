import 'package:flutter/material.dart';
import '../models/offer_model.dart'; // Import du modèle Offer

class ApplyPage extends StatelessWidget {
  final Offer offer; // Ajout de l'argument requis

  const ApplyPage({required this.offer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Postuler'),
      ),
      body: Center(
        child: Text(
            'Page de postulation pour l\'offre : ${offer.title}'), // Utilisation de l'offre
      ),
    );
  }
}
