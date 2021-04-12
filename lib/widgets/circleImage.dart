import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CircleImage extends StatelessWidget {

  final String imageUrl;
  CircleImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context,imageProvider) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0,),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(20.0),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: imageProvider,
            ),
          ),
        );
      },
      placeholder: (context , url) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
      errorWidget: (context, url, error) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.error
            ),
            Text(
              'Error Loading image',
            ),
          ],
        );
      },
    );
  }
}
