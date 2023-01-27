import 'package:flutter/material.dart';
import 'package:news_app/Home/DetailsScreen/newsScreenDetails.dart';
import 'package:news_app/model/provider.dart';
import 'package:provider/provider.dart';
import 'Home/homeScreen.dart';
import 'package:news_app/mytheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(
      ChangeNotifierProvider(create: (context) => AppConfig(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfig>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Home_Screen.routeName,
      routes: {
        Home_Screen.routeName: (context) => Home_Screen(),
        NewsDetailsScreen.routeName: (context) => NewsDetailsScreen()
      },
      theme: MyTheme.LightMode,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.language),
    );
  }
}
