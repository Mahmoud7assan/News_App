import 'package:flutter/material.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/mytheme.dart';

class TabsItem extends StatelessWidget {
  Source source;
  bool isSelected;

  TabsItem({required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: isSelected == true ? MyTheme.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: MyTheme.primaryColor)),
      child: Text(
        source.name ?? '',
        style: isSelected == true
            ? Theme.of(context).textTheme.headline1
            : Theme.of(context).textTheme.headline3,
      ),
    );
  }
}
