import 'package:flutter/material.dart';
import 'package:news_app/mytheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class HomeDrawer extends StatelessWidget {
  static const int categories = 1;

  static const int setting = 2;
  Function onClikedDrawer;

  HomeDrawer({required this.onClikedDrawer});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          color: MyTheme.primaryColor,
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 64),
          child: Text(
            AppLocalizations.of(context)!.newsapp,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: InkWell(
            onTap: () {
              onClikedDrawer(HomeDrawer.categories);
            },
            child: Row(
              children: [
                Icon(
                  Icons.list,
                  size: 24,
                  color: Colors.black,
                ),
                SizedBox(width: 10),
                Text(
                  AppLocalizations.of(context)!.category,
                  style: Theme.of(context).textTheme.headline2,
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: InkWell(
            onTap: (){
              onClikedDrawer(HomeDrawer.setting);
            },
            child: Row(
              children: [
                Icon(
                  Icons.settings,
                  size: 24,
                  color: Colors.black,
                ),
                SizedBox(width: 10),
                Text(
                  AppLocalizations.of(context)!.settings,
                  style: Theme.of(context).textTheme.headline2,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
