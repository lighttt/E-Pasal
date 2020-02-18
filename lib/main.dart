import 'package:epasal/provider/products_provider.dart';
import 'package:epasal/screens/product_details_screen.dart';
import 'package:epasal/screens/product_overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Products(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "E-Pasal",
        theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.red,
          fontFamily: "Lato",
        ),
        home: ProductOverviewScreen(),
        routes: {
          ProductOverviewScreen.routeId: (context) => ProductOverviewScreen(),
          ProductDetails.routeId: (context) => ProductDetails(),
        },
      ),
    );
  }
}
