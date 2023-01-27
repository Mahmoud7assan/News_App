import 'package:flutter/material.dart';
import 'package:news_app/Home/Tabs/Tabs_Container.dart';
import 'package:news_app/api_manger.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/model/category.dart';

class CategoryDetails extends StatelessWidget {
  CategoryModel category;
  CategoryDetails({required this.category});
  @override
  Widget build(BuildContext context) {

    return FutureBuilder<SourcesResponse>(
      future: ApiManger.getSources(category.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text("Something went wrong"),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Try again"))
            ],
          );
        }
        if (snapshot.data?.status != 'ok') {
          return Column(
            children: [
              Text(snapshot.data?.message ?? ''),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Try again"))
            ],
          );
        }
        var sourcesList = snapshot.data?.sources ?? [];
        return TabsContainer(sourcesList: sourcesList);

      },
    );
  }
}
