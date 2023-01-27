import 'package:flutter/material.dart';
import 'package:news_app/Home/Category/category_item.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/model/provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Categories_Screen extends StatelessWidget {
  var CategoryList = CategoryModel.getCategories();
  Function onClickedCategory;

  Categories_Screen({required this.onClickedCategory});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfig>(context);
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.pick,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 18, crossAxisSpacing: 18),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    onClickedCategory(CategoryList[index]);
                  },
                  child:
                      CategoryItem(index: index, category: CategoryList[index]),
                );
              },
              itemCount: CategoryList.length,
            ),
          )
        ],
      ),
    );
  }
}
