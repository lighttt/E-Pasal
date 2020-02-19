import 'package:epasal/widgets/badge.dart';
import 'package:epasal/widgets/product_grid.dart';
import 'package:flutter/material.dart';

enum FilterOptions { Favourites, All }

class ProductOverviewScreen extends StatefulWidget {
  static const String routeId = "/product_overview_screen";

  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool _showFavourites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("E-Pasal"),
          actions: <Widget>[
            PopupMenuButton(
              icon: Icon(Icons.more_vert),
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favourites) {
                    //show fav
                    _showFavourites = true;
                  } else {
                    //else not fav
                    _showFavourites = false;
                  }
                });
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: FilterOptions.Favourites,
                  child: Text("Show Favourites"),
                ),
                PopupMenuItem(
                  value: FilterOptions.All,
                  child: Text("Show All"),
                ),
              ],
            ),
            Badge(
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
              value: "0",
            )
          ],
        ),
        body: ProductGrid(_showFavourites));
  }
}
