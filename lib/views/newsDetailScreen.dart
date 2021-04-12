import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/viewModels/viewModel.dart';
import 'package:newsapp/widgets/circleImage.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsDetailScreen extends StatelessWidget {

  final ViewModel article;

  NewsDetailScreen(this.article);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CachedNetworkImage(
              imageUrl: article.urlToImage,
              imageBuilder: (context, imageProvider) => Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            SizedBox(
              width: 5.0,
            ),
            Container(
              constraints: BoxConstraints(
                maxWidth: 250.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Author',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    article.authour,
                    overflow: TextOverflow.clip,
                    style: TextStyle(

                  ),),
                ],
              ),
            )
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 30.0, right: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Divider(
                  color: Color(0xffff8a30),
                  height: 80.0,
                  thickness: 20.0,
                ),
                Text(
                  'Headline',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
            Center(
              child: Text(
                this.article.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                  wordSpacing: 3,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              this.article.publishedAt,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16.0,
              ),
            ),
            Container(
              height: 200.0,
              child: CircleImage(
                imageUrl: this.article.urlToImage,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              this.article.description,
            style: TextStyle(
              fontSize: 16.0,
              wordSpacing: 3,
            ),
            )
          ],
        ),
      ),
    );
  }
}
