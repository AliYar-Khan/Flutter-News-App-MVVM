import 'package:newsapp/models/news_article.dart';
import 'package:intl/intl.dart';

class ViewModel {
  NewsArticle _newsArticle;
  ViewModel({required NewsArticle article}): _newsArticle = article;

  String get title {
    return _newsArticle.title;
  }

  String get description {
    return _newsArticle.description;
  }

  String get publishedAt {
    final dateTime = DateFormat("yyyy-mm-ddTHH:mm:ssZ").parse(_newsArticle.publishedAt,true);
    return DateFormat.yMMMMEEEEd('en-us').format(dateTime);
  }

  String get url {
    return _newsArticle.url;
  }

  String get urlToImage {
    return _newsArticle.urlToImage;
  }

}