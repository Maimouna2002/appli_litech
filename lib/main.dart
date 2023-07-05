import 'package:flutter/material.dart';
import 'package:stageapp/routes.dart';
import 'package:stageapp/utils/const.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      debugShowCheckedModeBanner: false,
      theme: Constants.lightTheme(context),
      initialRoute: '/offers',
      routes: routes,
    );
  }
}
