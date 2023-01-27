import 'package:flutter/material.dart';
import 'package:news_app/Home/DetailsScreen/newsItem.dart';
import 'package:news_app/api_manger.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/model/provider.dart';
import 'package:provider/provider.dart';

class NewsContainer extends StatelessWidget {
  Source source;

  NewsContainer({required this.source});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfig>(context);
    return FutureBuilder<NewsResponse>(
        future: provider.isSearch && provider.query.isNotEmpty
            ? ApiManger.getNews(searchKey: provider.query)
            : ApiManger.getNews(sourceId: source.id ?? ''),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Column(
              children: [
                Text("somthing went wrong "),
                ElevatedButton(
                    onPressed: () {}, child: Text("please try again"))
              ],
            );
          }
          if (snapshot.data?.status != 'ok') {
            return Column(
              children: [
                Text(snapshot.data?.message ?? ''),
                ElevatedButton(
                    onPressed: () {}, child: Text("please try again"))
              ],
            );
          }
          var newsList = snapshot.data?.articles ?? [];
          return ListView.separated(
            itemBuilder: (context, index) {
              return NewsItem(news: newsList[index]);
            },
            itemCount: newsList.length,
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 25,
              );
            },
          );
        });
  }
}
