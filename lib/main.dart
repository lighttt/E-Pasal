import 'package:epasal/screens/product_overview_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "E-Pasal",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ProductOverviewScreen(),
    );
  }
}
