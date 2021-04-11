import 'package:dio/dio.dart';
import 'package:newsapp/models/news_article.dart';
import 'package:newsapp/constant/constants.dart';

class WebService {
  var dio = Dio();

  Future<List<NewsArticle>> getTopHeadlines () async {
    final response = await dio.get(Constants.apiTopHeadlines);
    if(response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    }
    else {
      throw Exception("Didn't get the articles");
    }
  }

  Future<List<NewsArticle>> getHeadlinesByCountry (String country) async {
    final response = await dio.get(Constants.headlinesFor(country));
    if(response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    }
    else {
      throw Exception("Didn't get the articles");
    }
  }

  Future<List<NewsArticle>> getHeadlinesByCategory (String category) async {
    final response = await dio.get(Constants.headlinesForCategory(category));
    if(response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    }
    else {
      throw Exception("Didn't get the articles");
    }
  }
}