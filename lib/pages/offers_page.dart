import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import '../models/offer_model.dart';
import '../services/offer_service.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_offer_card.dart';
import 'offer_details_page.dart';
import 'apply_page.dart';
import 'login_page.dart';

class OffersPage extends StatefulWidget {
  @override
  _OffersPageState createState() => _OffersPageState();
}

class _OffersPageState extends State<OffersPage> {
  List<Offer> offers = [];
  bool isAuthenticated = false;

  @override
  void initState() {
    super.initState();
    checkAuthentication();
    fetchOffers();
  }

  Future<void> checkAuthentication() async {
    final token = await getAccessToken();
    setState(() {
      isAuthenticated = token != null;
    });
  }

  Future<void> fetchOffers() async {
    OfferService offerService = OfferService();
    List<Offer> fetchedOffers = await offerService.fetchOffers();
    setState(() {
      offers = fetchedOffers;
    });
  }

  Future<String?> getAccessToken() async {
    final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
    return await secureStorage.read(key: 'access_token');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Offres de stage',
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
                if (isAuthenticated) {
                  navigateToApplyPage(offer);
                } else {
                  navigateToLoginPage();
                }
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

  void navigateToApplyPage(Offer offer) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ApplyPage(offer: offer),
      ),
    );
  }

  void navigateToLoginPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }
}
