import 'package:flutter/material.dart';

class MyTheme {
  static  Color primaryColor = Color(0xff39A552);
  static   Color WhiteColor = Colors.white;
  static  Color BlackColor = Colors.black;
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
          iconTheme: IconThemeData(color: WhiteColor,size: 30)),
      textTheme: TextTheme(
          headline1: TextStyle(
              color: WhiteColor, fontSize: 22, fontWeight: FontWeight.bold),
        headline2: TextStyle(
          color: BlackColor,
          fontWeight: FontWeight.bold,
          fontSize: 24
        ),
        headline3: TextStyle(
            color: primaryColor, fontSize: 22, fontWeight: FontWeight.bold),
      ));
}
