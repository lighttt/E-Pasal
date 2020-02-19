import 'package:epasal/provider/products_provider.dart';
import 'package:epasal/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  final bool showFav;
  ProductGrid(this.showFav);

  @override
  Widget build(BuildContext context) {
    final loadedProducts = Provider.of<Products>(context);
    final products = showFav ? loadedProducts.favourites : loadedProducts.items;
    return GridView.builder(
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 3 / 2,
        ),
        itemBuilder: (ctx, i) {
          return ChangeNotifierProvider.value(
            value: products[i],
            child: ProductItem(),
          );
        });
  }
}
