import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  // Name
  static const String appName = "Cdtic-Stage";

  // Material Design Colors
  static const Color lightPrimary = Color.fromARGB(255, 171, 218, 210);
  static const Color lightAccent = Color.fromARGB(255, 33, 223, 150);
  static const Color lightBackground = Color(0xFFFCFCFF);

  static const Color grey = Color(0xFF707070);
  static const Color textPrimary = Color(0xFF486581);
  static const Color textDark = Color(0xFF305F72);

  // Salmon
  static const Color salmonMain = Color.fromARGB(255, 140, 241, 182);
  static const Color salmonDark = Color.fromARGB(255, 81, 236, 185);
  static const Color salmonLight = Color.fromARGB(255, 15, 236, 163);

  // Blue
  static const Color blueMain = Color(0xFF579ACA);
  static const Color blueDark = Color(0xFF4E92B1);
  static const Color blueLight = Color(0xFF5AA6C8);

  // Pink
  static const Color lightPink = Color(0xFFFAE4F4);

  // Yellow
  static const Color lightYellow = Color(0xFFFFF5E5);

  // Violet
  static const Color lightViolet = Color(0xFFFBF5FF);

  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      backgroundColor: lightBackground,
      primaryColor: lightPrimary,
      colorScheme: ColorScheme.light(
        primary: lightPrimary,
        secondary: lightAccent,
      ),
      scaffoldBackgroundColor: lightBackground,
      textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: lightAccent,
        ), toolbarTextStyle: GoogleFonts.latoTextTheme(Theme.of(context).textTheme).bodyText2, titleTextStyle: GoogleFonts.latoTextTheme(Theme.of(context).textTheme).headline6,
      ),
    );
  }

  static const double headerHeight = 228.5;
  static const double mainPadding = 20.0;
}
