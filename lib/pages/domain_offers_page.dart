import 'package:flutter/material.dart';
import 'package:stageapp/widgets/custom_offer_card.dart';
import '../models/auth_model.dart';
import '../models/offer_model.dart';
import '../services/offer_service.dart';
import 'apply_page.dart';
import 'offer_details_page.dart';

class DomainOffersPage extends StatefulWidget {
  final String domainName;

  const DomainOffersPage({Key? key, required this.domainName})
      : super(key: key);

  @override
  _DomainOffersPageState createState() => _DomainOffersPageState();
}

class _DomainOffersPageState extends State<DomainOffersPage> {
  List<Offer> offers = [];

  @override
  void initState() {
    super.initState();
    fetchDomainOffers();
  }

  Future<void> fetchDomainOffers() async {
    OfferService offerService = OfferService();
    List<Offer> fetchedOffers =
        await offerService.fetchDomainOffers(widget.domainName);
    setState(() {
      offers = fetchedOffers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offres pour ${widget.domainName}'),
      ),
      body: ListView.builder(
        itemCount: offers.length,
        itemBuilder: (BuildContext context, int index) {
          Offer offer = offers[index];
          return GestureDetector(
            onTap: () => navigateToOfferDetails(offer),
            child: CustomOfferCard(
              offer: offer,
              onApply: () {
                // Logique pour postuler à l'offre
                navigateToApplyPage(offer);
              },
              onViewDetails: () {
                // Logique pour afficher les détails de l'offre
                navigateToOfferDetails(offer);
              },
            ),
          );
        },
      ),
    );
  }

  void navigateToOfferDetails(Offer offer) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OfferDetailsPage(offer: offer),
      ),
    );
  }

  void navigateToApplyPage(Offer offer, User user) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ApplyPage(
          offer: offer,
          user: user,
        ),
      ),
    );
  }
}
