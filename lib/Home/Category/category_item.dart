import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/category.dart';

class CategoryItem extends StatelessWidget {
  int index;
  CategoryModel category;

  CategoryItem({required this.index, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Color(category.color),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
              bottomLeft: Radius.circular((index % 2 == 0) ? 18 : 0),
              bottomRight: Radius.circular((index % 2 == 0) ? 0 : 18))),
      child: Column(
        children: [
          Image(
            image: AssetImage(category.imagePath),
            height: 100,
          ),
          Text(
            category.title,
            style: Theme.of(context).textTheme.displayLarge,
          )
        ],
      ),
    );
  }
}
