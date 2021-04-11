import 'package:flutter/material.dart';
import 'package:newsapp/viewModels/viewModel.dart';
import 'package:newsapp/views/newsDetailScreen.dart';
import 'package:newsapp/widgets/circleImage.dart';

class NewsGrid extends StatelessWidget {

  final List<ViewModel> articles;

  NewsGrid({required this.articles});
  void showNewsDetail(BuildContext context , ViewModel vm) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return NewsDetailScreen(vm);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: articles.length,
        itemBuilder: (_,index) {
          var article = articles[index];
          return GestureDetector(
            onTap: () {
              showNewsDetail(context, article);
            },
            child: GridTile(
              child: Container(
                child: CircleImage(imageUrl: article.urlToImage,),
              ),
              footer: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0,),
                child: Text(
                  article.title,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          );
        }
    );
  }
}
