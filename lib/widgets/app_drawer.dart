import 'package:epasal/screens/order_screen.dart';
import 'package:epasal/screens/product_overview_screen.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Manish Tuladhar'),
            accountEmail: Text('manish.eclipse@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Shop'),
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, ProductOverviewScreen.routeId);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Orders'),
            onTap: () {
              Navigator.pushReplacementNamed(context, OrderScreen.routeId);
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
