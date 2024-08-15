import 'package:app_comerce/models/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  final List<Product> _shop = [
    Product(
      name: "NIKE",
      price: 50,
      description: "The best shoe",
      imagePath: "lib/assets/nike1.png",
    ),
    Product(
      name: "NIKE",
      price: 50,
      description: "The best shoe",
      imagePath: "lib/assets/nike2.png",
    ),
    Product(
      name: "NIKE",
      price: 50,
      description: "The best shoe",
      imagePath: "lib/assets/nike3.png",
    ),
    Product(
      name: "NIKE",
      price: 50,
      description: "The best shoe",
      imagePath: "lib/assets/nike4.png",
    ),
  ];

  List<Product> _cart = [];

  List<Product> get shop => _shop;

  List<Product> get cart => _cart;

  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
