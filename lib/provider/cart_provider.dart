import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final double price;
  final int quantity;

  CartItem(
      {@required this.id,
      @required this.title,
      @required this.price,
      @required this.quantity});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return _items;
  }

  //----------- this gives us total items in the cart ------------
  int get itemCount {
    return _items == null ? 0 : _items.length;
  }

  // ------------- this adds items to the cart ------------
  void addToCart(String productId, String title, double price) {
    if (_items.containsKey(productId)) {
      //update the current item ko quantity
      _items.update(
          productId,
          (existingCartItem) => CartItem(
                id: existingCartItem.id,
                title: existingCartItem.title,
                price: existingCartItem.price,
                quantity: existingCartItem.quantity + 1,
              ));
    } else {
      //if no item then add item to cart
      _items.putIfAbsent(
          productId,
          () => CartItem(
                id: DateTime.now().toString(),
                title: title,
                price: price,
                quantity: 1,
              ));
    }
    notifyListeners();
  }

  // this is used to remove items from the cart
  void removeFromCart(String id) {
    _items.remove(id);
    notifyListeners();
  }

  // this is used to calculate total amount
  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.quantity * cartItem.price;
    });
    return total;
  }

  // this remove all items from cart
  void clearCart() {
    _items = {};
    notifyListeners();
  }

  // this removes a single item from cart
  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId].quantity > 1) {
      _items.update(productId, (existingCartItem) {
        return CartItem(
            id: existingCartItem.id,
            title: existingCartItem.title,
            price: existingCartItem.price,
            quantity: existingCartItem.quantity - 1);
      });
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }
}
