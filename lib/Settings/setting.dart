import 'package:flutter/material.dart';
import 'package:news_app/Settings/language.dart';
import 'package:news_app/model/provider.dart';
import 'package:news_app/mytheme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingTab extends StatefulWidget {
  const SettingTab({Key? key}) : super(key: key);

  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfig>(context);
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          SizedBox(height: 10),
          InkWell(
            onTap: () {
              ShowLanguageSheet();
            },
            child: Container(
              padding: EdgeInsets.all(10),
              width: 300,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(color: MyTheme.primaryColor),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.language == 'en'
                        ? AppLocalizations.of(context)!.english
                        : AppLocalizations.of(context)!.arabic,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  Icon(
                    Icons.arrow_drop_down_sharp,
                    size: 20,
                    color: MyTheme.primaryColor,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void ShowLanguageSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return LanguageSheet();
        });
  }
}
