import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _items = [];

  // Getter for cart items
  List<Map<String, dynamic>> get items => _items;

  // Add a product to the cart
  void addToCart(Map<String, dynamic> product) {
    final index = _items.indexWhere((item) => item['id'] == product['id']);
    if (index >= 0) {
      _items[index]['quantity'] = (_items[index]['quantity'] as int? ?? 1) + 1;
    } else {
      _items.add({...product, 'quantity': 1});
    }
    notifyListeners();
  }

  // Update the quantity of a product in the cart
  void updateQuantity(Map<String, dynamic> product, int change) {
    final index = _items.indexWhere((item) => item['id'] == product['id']);
    if (index >= 0) {
      _items[index]['quantity'] = (_items[index]['quantity'] as int? ?? 1) + change;
      if (_items[index]['quantity'] <= 0) {
        _items.removeAt(index);
      }
      notifyListeners();
    }
  }

  // Remove a product from the cart
  void removeFromCart(Map<String, dynamic> product) {
    _items.removeWhere((item) => item['id'] == product['id']);
    notifyListeners();
  }

  // Clear all items from the cart
  void clearCart() {
    _items = [];
    notifyListeners();
  }

  // Getter for total price
  double get totalPrice {
    return _items.fold(0.0, (sum, item) {
      final price = (item['price'] as num?)?.toDouble() ?? 0.0;
      final quantity = (item['quantity'] as int?) ?? 1;
      return sum + price * quantity;
    });
  }
}