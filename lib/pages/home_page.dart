import 'package:flutter/material.dart';
import 'package:stageapp/models/offer_model.dart';
import 'package:stageapp/pages/apply_page.dart';
import 'package:stageapp/pages/domain_offers_page.dart';
import 'package:stageapp/pages/offer_details_page.dart';
import 'package:stageapp/services/auth_service';
import 'package:stageapp/services/offer_service.dart';
import 'package:stageapp/theme/colors.dart';
import 'package:stageapp/theme/padding.dart';
import 'package:stageapp/widgets/clipper.dart';
import 'package:stageapp/widgets/custom_app_bar.dart';
import 'package:stageapp/widgets/custom_heading.dart';
import 'package:stageapp/widgets/custom_offer_card.dart';
import 'package:stageapp/widgets/custom_search_field.dart';
import 'package:stageapp/widgets/custom_title.dart';

import '../models/auth_model.dart';
import '../widgets/custom_domain_card.dart';
import 'login_page';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Domain>> _domainsFuture;
  late Future<List<Offer>> _offersFuture;

  @override
  void initState() {
    super.initState();
    _domainsFuture = OfferService().fetchDomains();
    _offersFuture = OfferService().fetchRecentOffers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Portail Academique de l\'université de Ngaoundere',
        showBackButton: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                ClipPath(
                  clipper: BottomClipper(),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage('assets/images/LOCALISATIONCDTIC.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: appPadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      SizedBox(height: spacer + 24),
                      CustomHeading(
                        title: 'Bienvenue sur CDTIC-stage',
                        subTitle:
                            'Découvrez de nouvelles opportunités de stage.',
                        color: AppColors.textWhite,
                      ),
                      SizedBox(height: spacer + 10),
                      CustomSearchField(
                        hintField: 'Cherchez les offres de stage',
                        backgroundColor: AppColors.background,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding:
                  const EdgeInsets.only(left: appPadding, right: appPadding),
              child: CustomTitle(title: 'Les Domaines d\'étude'),
            ),
            SizedBox(height: smallSpacer),
            FutureBuilder<List<Domain>>(
              future: _domainsFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(
                      left: appPadding,
                      right: appPadding - 10.0,
                    ),
                    child: Row(
                      children: snapshot.data!.map((domain) {
                        return Padding(
                          padding:
                              const EdgeInsets.only(right: 10.0, bottom: 10.0),
                          child: GestureDetector(
                            onTap: () {
                              navigateToDomainOffers(domain.name);
                            },
                            child: CustomDomainCard(
                              domain: domain,
                              title: domain.name,
                              onTap: () {
                                // Logique pour gérer le clic sur le domaine
                              },
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const Text('Échec du chargement des domaines');
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding:
                  const EdgeInsets.only(left: appPadding, right: appPadding),
              child: CustomTitle(title: 'Les Offres Récentes'),
            ),
            SizedBox(height: smallSpacer),
            FutureBuilder<List<Offer>>(
              future: _offersFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16.0),
                    itemBuilder: (context, index) {
                      final offer = snapshot.data![index];
                      return CustomOfferCard(
                        offer: offer,
                        onApply: () {
                          navigateToApplyPage(offer);
                        },
                        onViewDetails: () {
                          navigateToOfferDetails(offer);
                        },
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Text('Failed to fetch offers');
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void navigateToDomainOffers(String domainName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DomainOffersPage(domainName: domainName),
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

  void navigateToApplyPage(Offer offer) async {
    User? user = await AuthService().getUserDetails();

    bool isLoggedIn = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );

    if (isLoggedIn == true) {
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
}
