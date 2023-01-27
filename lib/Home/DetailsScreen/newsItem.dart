import 'package:flutter/material.dart';
import 'package:news_app/Home/DetailsScreen/newsScreenDetails.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/mytheme.dart';

class NewsItem extends StatelessWidget {
  News news;

  NewsItem({required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: MyTheme.WhiteColor, borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(NewsDetailsScreen.routeName,
              arguments: news); //transfer data to new details screen
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                clipBehavior: Clip.antiAlias, //rounded image
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.network(news.urlToImage ?? '')),
            Container(
              padding: EdgeInsets.all(7),
              margin: EdgeInsets.all(7),
              decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                news.source?.id ?? '',
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            Text(news.title ?? ''),
            //Text(news.content ?? ''),
            Text(
              news.publishedAt ?? '',
              textAlign: TextAlign.end,
            )
          ],
        ),
      ),
    );
  }
}
