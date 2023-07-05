import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopItems = [
    ["avocado", "4.00", "images/avocado.png", Colors.green],
    ["banana", "2.00", "images/banana.png", Colors.yellow],
    ["chicken", "14.00", "images/chicken.png", Colors.brown],
    ["water", "1.00", "images/water.png", Colors.blue],
  ];
  get shopItems => _shopItems;

  List _cartItems = [];

  get shopItem => _shopItems;

  get CartItems => _cartItems;

  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  String calculateTotal() {
    double totalPrice = 0;
    for (var i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
