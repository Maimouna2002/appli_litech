import 'package:flutter/material.dart';
import 'package:stageapp/pages/home_page.dart';
import 'package:stageapp/pages/application_page.dart';
import 'package:stageapp/pages/offers_page.dart';
import 'package:stageapp/theme/colors.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    List<Widget> pages = [
      HomePage(),
      OffersPage(),
      const ApplicationPage(),
      //const AccountPage(),
    ];
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getFooter() {
    return BottomNavigationBar(
      currentIndex: pageIndex,
      onTap: (index) {
        setState(() {
          pageIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Accueil',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'Offres',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment),
          label: 'Candidatures',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Parametres',
        ),
      ],
      selectedItemColor: AppColors.primary,
      unselectedItemColor: Colors.grey,
    );
  }
}
