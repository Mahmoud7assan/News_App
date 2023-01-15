import 'package:flutter/material.dart';
import 'homeScreen.dart';
import 'package:news_app/mytheme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Home_Screen.routeName,
      routes: {Home_Screen.routeName: (context) => Home_Screen()},
      theme: MyTheme.LightMode,
    );
  }
}
