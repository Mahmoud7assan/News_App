import 'package:flutter/material.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/mytheme.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsScreen extends StatelessWidget {
  static const String routeName = 'NewsScreen';

  @override
  Widget build(BuildContext context) {
    var news = ModalRoute.of(context)?.settings.arguments as News;
    return Container(
      decoration: BoxDecoration(
          color: MyTheme.WhiteColor,
          image: DecorationImage(
              image: AssetImage('assets/images/pattern.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            news.source?.name ?? '',
            style: Theme.of(context).textTheme.headline1,
          ),

          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  clipBehavior: Clip.antiAlias, //rounded image
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.network(news.urlToImage ?? '')),
              SizedBox(height: 8),
              Text(
                news.source?.id ?? '',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(height: 8),

              Text(news.title ?? ''),
              //Text(news.content ?? ''),
              Text(
                news.publishedAt ?? '',
                textAlign: TextAlign.end,
              ),
              Container(
                margin: EdgeInsets.all(15),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: MyTheme.WhiteColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(news.description ?? '',
                        style:
                            TextStyle(color: MyTheme.BlackColor, fontSize: 17),
                        textScaleFactor: 1.5),
                    TextButton(
                        onPressed: () {
                          openUrl(news.url);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('View Full Article',
                                style: TextStyle(color: MyTheme.BlackColor)),
                            Icon(
                              Icons.arrow_right,
                              color: MyTheme.BlackColor,
                            )
                          ],
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void openUrl(String? url) async {
  if (url == null) {
    return;
  }
  var uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  }
}
