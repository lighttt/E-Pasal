import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String imgUrl;
  final String title;
  final double price;

  ProductItem(this.title, this.price, this.imgUrl);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(imgUrl,loadingBuilder: (context,),),
    );
  }
}
