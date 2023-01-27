import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/mytheme.dart';
import 'package:news_app/model/provider.dart';
import 'package:provider/provider.dart';

class LanguageSheet extends StatefulWidget {
  @override
  State<LanguageSheet> createState() => _LanguageSheetState();
}

class _LanguageSheetState extends State<LanguageSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfig>(context);
    return Container(
      margin: EdgeInsets.all(18),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      )),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.ChangeLanguage('en');
            },
            child: provider.language == 'en'
                ? selected(AppLocalizations.of(context)!.english)
                : unselected(AppLocalizations.of(context)!.english),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              provider.ChangeLanguage('ar');
            },
            child: provider.language == 'ar'
                ? selected(AppLocalizations.of(context)!.arabic)
                : unselected(AppLocalizations.of(context)!.arabic),
          ),
        ],
      ),
    );
  }

  Widget selected(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        Icon(Icons.check, color: MyTheme.primaryColor)
      ],
    );
  }

  Widget unselected(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: TextStyle(fontSize: 18, color: MyTheme.BlackColor))
      ],
    );
  }
}
