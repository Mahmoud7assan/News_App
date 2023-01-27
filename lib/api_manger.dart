import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';

class ApiManger {
// https://newsapi.org/v2/top-headlines/sources?apiKey=6933184b6a9e41c38dee97b08e9bf093
  static const String baseUrl = 'newsapi.org';

  static Future<SourcesResponse> getSources(String categoryId) async {
    var url = Uri.https(baseUrl, '/v2/top-headlines/sources',
        {'apiKey': '6933184b6a9e41c38dee97b08e9bf093', 'category': categoryId});
    try {
      var response = await http.get(url);
      var bodystring = response.body;
      var json = jsonDecode(bodystring);
      var sourcesResonse = SourcesResponse.fromJson(json);
      return sourcesResonse;
    } catch (e) {
      throw e;
    }
  }

  //https://newsapi.org/v2/everything?sources=abc-news&apiKey=6933184b6a9e41c38dee97b08e9bf093
  static Future<NewsResponse> getNews(
      {String? sourceId, String? searchKey}) async {
    var url = Uri.https(baseUrl, '/v2/everything', {
      'apiKey': '6933184b6a9e41c38dee97b08e9bf093',
      'sources': sourceId,
      'q': searchKey
    });
    try {
      var response = await http.get(url);
      var bodyResponse = response.body;
      var json = jsonDecode(bodyResponse);
      var newsResponse = NewsResponse.fromJson(json);
      return newsResponse;
    } catch (e) {
      throw e;
    }
  }
}
