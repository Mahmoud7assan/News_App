import 'package:flutter/material.dart';
import 'package:news_app/mytheme.dart';

class Home_Screen extends StatelessWidget {
  static const String routeName = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News App",
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: true,
      ),
    );
  }
}
