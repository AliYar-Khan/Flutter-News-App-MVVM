import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/viewModels/viewModel.dart';
import 'package:newsapp/widgets/circleImage.dart';

class NewsDetailScreen extends StatelessWidget {

  final ViewModel article;

  NewsDetailScreen(this.article);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            article.title,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(right: 20.0,left: 20.0,top: 20.0),
        child: Column(
          children: [
            Container(
              height: 250.0,
              child: CircleImage(
                imageUrl: this.article.urlToImage,
              ),
            ),
            Text(
              this.article.publishedAt,
            ),
            SizedBox(
              height: 5.0,
            ),
            Center(
              child: Text(
                this.article.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
            SizedBox(
              height: 9.0,
            ),
            Text(
              this.article.description,
            style: TextStyle(
              fontSize: 15.0,

            ),
            )
          ],
        ),
      ),
    );
  }
}
