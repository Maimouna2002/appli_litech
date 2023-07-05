import 'package:flutter/material.dart';
import 'package:stageapp/screens/home_screen.dart';
import 'package:stageapp/screens/type_offers_screen.dart';
import 'package:stageapp/screens/login_screen.dart';
import 'package:stageapp/screens/signup_screen.dart';
import 'package:stageapp/screens/offers_screen.dart';
//import 'package:stageapp/screens/offer_details_screen.dart';
import 'package:stageapp/screens/profile_screen.dart';

final Map<String, WidgetBuilder> routes = {
  '/login': (BuildContext context) => const LoginScreen(),
  '/signup': (BuildContext context) => const SignupScreen(),
  '/offers': (BuildContext context) => const OffersScreen(),
  '/offer_types': (BuildContext context) => const TypeOffersScreen(),
  '/profile': (BuildContext context) => const ProfileScreen(),
  '/home': (BuildContext context) => HomeScreen(),

};
