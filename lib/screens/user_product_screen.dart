import 'package:epasal/provider/products_provider.dart';
import 'package:epasal/screens/edit_product_screen.dart';
import 'package:epasal/widgets/app_drawer.dart';
import 'package:epasal/widgets/user_product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProductScreen extends StatelessWidget {
  static const routeId = '/user_product_screen';

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Products'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, EditProductScreen.routeId);
            },
          )
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemBuilder: (ctx, index) => UserProductItem(
              productsData.items[index].id,
              productsData.items[index].title,
              productsData.items[index].imageURL),
          itemCount: productsData.items.length,
        ),
      ),
    );
  }
}
