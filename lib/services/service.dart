import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/models/news_article.dart';
import 'package:newsapp/constant/constants.dart';

class WebService {

  Future<List<NewsArticle>> getTopHeadlines () async {
    var url = Uri.parse(Constants.apiTopHeadlines);
    var response = await http.get(url);
    if(response.statusCode == 200) {
      final result = response.body;
      print('Response body getTopHeadlines: $result');
      var json = jsonDecode(result.toString());
      Iterable list = json['articles'];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    }
    else {
      throw Exception("Didn't get the articles");
    }
  }

  Future<List<NewsArticle>> getHeadlinesByCountry (String country) async {
    var url = Uri.parse(Constants.headlinesFor(country));
    final response = await http.get(url);
    if(response.statusCode == 200) {
      final result = response.body;
      print('Response body getHeadlinesByCountry: $result');
      var json = jsonDecode(result.toString());
      Iterable list = json['articles'];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    }
    else {
      throw Exception("Didn't get the articles");
    }
  }

  Future<List<NewsArticle>> getHeadlinesByCategory (String category) async {
    var url = Uri.parse(Constants.headlinesForCategory(category));
    final response = await http.get(url);
    if(response.statusCode == 200) {
      final result = response.body;
      print('Response body getHeadlinesByCategory: $result');
      var json = jsonDecode(result.toString());
      Iterable list = json['articles'];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    }
    else {
      throw Exception("Didn't get the articles");
    }
  }
}