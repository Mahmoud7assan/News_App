import 'package:flutter/material.dart';
import 'package:news_app/Home/Category/categoryDetails.dart';
import 'package:news_app/Settings/setting.dart';
import 'package:news_app/Home/Home_drawer.dart';
import 'package:news_app/Home/Category/categories_screen.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/model/provider.dart';
import 'package:news_app/mytheme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Home_Screen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfig>(context);
    return Container(
      decoration: BoxDecoration(
          color: MyTheme.WhiteColor,
          image: DecorationImage(opacity: 100,
              image: AssetImage('assets/images/pattern.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            toolbarHeight: 75,
            automaticallyImplyLeading: provider.isSearch ? false : true,
            actions: [
              selectCategory == null
                  ? Container()
                  : IconButton(
                      onPressed: () {
                        //showSearch(context: context, delegate: Search_Tab());

                        provider.isSearchEnable();
                      },
                      icon: Icon(
                        provider.isSearch ? null : Icons.search,
                        size: 32,
                      ))
            ],
            title: provider.isSearch
                ? Container(
                    margin: EdgeInsets.symmetric(vertical: 25),
                    child: TextFormField(
                      validator: (text) {},
                      onChanged: (text) {
                        provider.KeyWordSeach(text);
                      },
                      decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!.search,
                          hintStyle: TextStyle(
                              color: Color(0x4c39a552),
                              fontWeight: FontWeight.bold),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: Colors.white)),
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                provider.isSearch = false;
                              });
                            },
                            icon: Icon(
                              Icons.clear,
                              color: MyTheme.primaryColor,
                            ),
                          ),
                          suffixIcon: Icon(
                            Icons.search,
                            color: MyTheme.primaryColor,
                          )),
                    ),
                  )
                : Text(
                    AppLocalizations.of(context)!.newsapp,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
            centerTitle: true,
          ),
          drawer: provider.isSearch
              ? null
              : Drawer(
                  child: HomeDrawer(
                    onClikedDrawer: onClikedDrawer,
                  ),
                ),
          body: selectedDrawer == HomeDrawer.setting
              ? SettingTab()
              : selectCategory == null
                  ? Categories_Screen(onClickedCategory: onClickedCategory)
                  : CategoryDetails(category: selectCategory!)),
    );
  }

  CategoryModel? selectCategory = null;

  void onClickedCategory(CategoryModel category) {
    selectCategory = category;
    setState(() {});
  }

  var selectedDrawer = HomeDrawer.categories;

  void onClikedDrawer(int selectIndex) {
    Navigator.pop(context);
    selectedDrawer = selectIndex;
    selectCategory = null;
    setState(() {});
  }
}
