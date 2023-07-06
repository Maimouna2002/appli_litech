import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/offer_model.dart';
import '../theme/colors.dart';
import '../theme/padding.dart';
import '../widgets/clipper.dart';
import '../widgets/custom_heading.dart';
import '../widgets/custom_offer_card.dart';
import '../widgets/custom_search_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.0),
        child: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              ClipPath(
                clipper: BottomClipper(),
                child: Container(
                  width: size.width,
                  height: 300.0,
                  decoration: BoxDecoration(
                    color: secondary,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: appPadding),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: spacer + 24),

                    // Heading
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomHeading(
                          title: 'Bienvenue sur CDTIC-stage',
                          subTitle:
                              'Découvrez de nouvelles opportunités de stage.',
                          color: textWhite,
                        ),
                        Container(
                          height: spacer,
                          width: spacer,
                        ),
                      ],
                    ),
                    SizedBox(height: spacer),

                    // Search
                    CustomSearchField(
                      hintField: 'Cherchez les offres de stage',
                      backgroundColor: background,
                    ),
                    SizedBox(height: spacer - 30.0),

                    // Category card
                    // TODO: Add category card
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: large),
          CustomOfferCard(
                      backgroundColor: background,

          ),
        ],
      ),
    );
  }
}
