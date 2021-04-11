
class NewsArticle {
  String title = '';
  String description = '';
  String url = '';
  String publishedAt = '';
  String urlToImage = '';

  NewsArticle(
      {required this.title,
      required this.description,
      required this.url,
      required this.publishedAt,
      required this.urlToImage});

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
        title: json['title'],
        description: json['description'],
        url: json['url'],
        publishedAt: json['publishedAt'],
        urlToImage: json['urlToImage']);
  }


}
