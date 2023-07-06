import 'package:flutter/material.dart';
import 'package:stageapp/root_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'WorkSans'),
      debugShowCheckedModeBanner: false,
      home: RootApp(),
    );
  }
}
