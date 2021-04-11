import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CategoryTile extends StatelessWidget {
  final String imageUrl,categoryName;

  CategoryTile({required this.imageUrl,required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: Stack(
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 170,
                height: 90,
                fit: BoxFit.cover,
              ),
          ),
          Container(
            alignment: Alignment.center,
            width: 170, height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.black26,
            ),
            child: Text(categoryName,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
