import 'package:flutter/material.dart';
import 'package:newsapp/models/news_article.dart';
import 'package:newsapp/services/service.dart';
import 'package:newsapp/viewModels/viewModel.dart';

enum LoadingStatus {
  Completed,
  Empty,
  Searching,
}

class ListViewModel with ChangeNotifier{

  LoadingStatus status = LoadingStatus.Empty;

  List<ViewModel> articles = <ViewModel>[];

  void getTopHeadlines() async {
    List<NewsArticle> _newsArticles = await WebService().getTopHeadlines();
    status = LoadingStatus.Searching;
    notifyListeners();
    this.articles = _newsArticles.map((article) => ViewModel(article: article)).toList();

    if(this.articles.isEmpty) {
      status = LoadingStatus.Empty;
    }else {
      status = LoadingStatus.Completed;
    }
    notifyListeners();
  }

  void fetchNewsByCountry(String country) async {
    List<NewsArticle> _newsArticles = await WebService().getHeadlinesByCountry(country);
    status = LoadingStatus.Searching;
    notifyListeners();
    this.articles = _newsArticles.map((article) => ViewModel(article: article)).toList();

    if(this.articles.isEmpty) {
    status = LoadingStatus.Empty;
    }else {
    status = LoadingStatus.Completed;
    }
    notifyListeners();
  }

  void fetchNewsByCategory (String category) async{
    List<NewsArticle> _newsArticles = await WebService().getHeadlinesByCategory(category);
    status = LoadingStatus.Searching;
    notifyListeners();
    this.articles = _newsArticles.map((article) => ViewModel(article: article)).toList();

    if(this.articles.isEmpty) {
      status = LoadingStatus.Empty;
    }else {
      status = LoadingStatus.Completed;
    }
    notifyListeners();
  }
}