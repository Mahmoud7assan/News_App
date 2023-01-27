import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryColor = Color(0xff39A552);
  static Color grayColor = Color(0xff79828B);
  static Color FontColor = Color(0xff4F5A69);
  static Color WhiteColor = Colors.white;
  static Color BlackColor = Colors.black;
  static ThemeData LightMode = ThemeData(
      primaryColor: primaryColor,
      appBarTheme: AppBarTheme(
          centerTitle: true,
          color: primaryColor,
          elevation: 0,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(35),
                  bottomLeft: Radius.circular(35))),
          iconTheme: IconThemeData(color: WhiteColor, size: 30)),
      textTheme: TextTheme(
          displayLarge: TextStyle(
              color: WhiteColor, fontSize: 18, fontWeight: FontWeight.bold),
          displayMedium: TextStyle(
              color: BlackColor, fontWeight: FontWeight.bold, fontSize: 18),
          displaySmall: TextStyle(
              color: primaryColor, fontSize: 20, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(color: grayColor, fontSize: 15),
          headlineLarge: TextStyle(
              color: FontColor, fontSize: 25, fontWeight: FontWeight.bold)));
}
