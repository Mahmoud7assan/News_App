import 'package:flutter/material.dart';
import 'package:news_app/Home/Tabs/Tabs_Item.dart';
import 'package:news_app/Home/DetailsScreen/newsContainer.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/model/provider.dart';
import 'package:provider/provider.dart';

class TabsContainer extends StatefulWidget {
  List<Source> sourcesList;

  TabsContainer({required this.sourcesList});

  @override
  State<TabsContainer> createState() => _TabsContainerState();
}

class _TabsContainerState extends State<TabsContainer> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfig>(context);
    return DefaultTabController(
        length: widget.sourcesList.length,
        child: Column(
          children: [
            if(!provider.isSearch)
            TabBar(
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                isScrollable: true,
                indicatorColor: Colors.transparent,
                tabs: widget.sourcesList
                    .map((source) => TabsItem(
                        source: source,
                        isSelected: selectedIndex ==
                            widget.sourcesList.indexOf(source)))
                    .toList()),
            Expanded(child: NewsContainer(source: widget.sourcesList[selectedIndex]))
          ],
        ));
  }
}
