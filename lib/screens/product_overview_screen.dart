import 'package:epasal/widgets/product_grid.dart';
import 'package:flutter/material.dart';

class ProductOverviewScreen extends StatelessWidget {
  static const String routeId = "/product_overview_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("E-Pasal"),
        ),
        body: ProductGrid());
  }
}
