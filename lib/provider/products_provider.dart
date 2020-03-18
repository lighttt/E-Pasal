import 'package:epasal/provider/product.dart';
import 'package:flutter/material.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
        id: "first",
        title: "Watch",
        price: 2000,
        description: "The best watch you will find anywhere.",
        imageURL:
            "https://www.surfstitch.com/on/demandware.static/-/Sites-ss-master-catalog/default/dwef31ef54/images/MBB-M43BLK/BLACK-WOMENS-ACCESSORIES-ROSEFIELD-WATCHES-MBB-M43BLK_1.JPG",
        isFavourite: false),
    Product(
        id: "second",
        title: "Shoes",
        price: 1500,
        description: "Quality and comfort shoes with fashionable style.",
        imageURL:
            "https://assets.adidas.com/images/w_600,f_auto,q_auto:sensitive,fl_lossy/e06ae7c7b4d14a16acb3a999005a8b6a_9366/Lite_Racer_RBN_Shoes_White_F36653_01_standard.jpg",
        isFavourite: false),
    Product(
        id: "third",
        title: "Laptop",
        price: 80000,
        description: "The compact and powerful gaming laptop under the budget.",
        imageURL:
            "https://d4kkpd69xt9l7.cloudfront.net/sys-master/images/h57/hdd/9010331451422/razer-blade-pro-hero-mobile.jpg",
        isFavourite: false),
    Product(
        id: "four",
        title: "T-Shirt",
        price: 1000,
        description: "A red color tshirt you can wear at any occassion.",
        imageURL:
            "https://5.imimg.com/data5/LM/NA/MY-49778818/mens-round-neck-t-shirt-500x500.jpg",
        isFavourite: false),
  ];

  // ---- this returns all items of the product list ---------
  List<Product> get items {
    return [..._items];
  }

  // --- this returns only favourite products from the list -----
  List<Product> get favourites {
    return _items.where((prodItem) {
      return prodItem.isFavourite;
    }).toList();
  }

  // ---- this returns particular item from id ---------
  Product findById(String id) {
    return items.firstWhere((prod) {
      return prod.id == id;
    });
  }

  // ----- this function adds new product ----------
  void addProduct(Product product) {
    final newProduct = Product(
        id: DateTime.now().toString(),
        title: product.title,
        price: product.price,
        description: product.description,
        imageURL: product.imageURL);
    _items.add(newProduct);
    //_items.insert(0, newProduct);
    notifyListeners();
  }

  // ---- this function updates the current product ------
  void updateProduct(String id, Product upProduct) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = upProduct;
      notifyListeners();
    }
  }

  // --- this function deletes a product -------
  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}
