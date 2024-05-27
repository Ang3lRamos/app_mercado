import 'package:flutter/material.dart';

class CartItem {
  final String name;
  final double price;
  final String imageUrl;
  int quantity;

  CartItem({
    required this.name,
    required this.price,
    required this.imageUrl,
    this.quantity = 1,
  });
}

class Purchase {
  final List<CartItem> items;
  final double total;
  final DateTime timestamp;

  Purchase({
    required this.items,
    required this.total,
    required this.timestamp,
  });
}

class PurchaseHistory {
  List<Purchase> history = [];

  void addPurchase(List<CartItem> items, double total) {
    final timestamp = DateTime.now();
    final purchase = Purchase(items: items, total: total, timestamp: timestamp);
    history.add(purchase);
  }
}

class CartModel {
  List<CartItem> cartItems = [];
  PurchaseHistory purchaseHistory = PurchaseHistory();

  void addToCart(CartItem item) {
    final existingItemIndex =
    cartItems.indexWhere((cartItem) => cartItem.name == item.name);

    if (existingItemIndex != -1) {
      cartItems[existingItemIndex].quantity += 1;
    } else {
      cartItems.add(item);
    }
  }

  double getTotal() {
    double total = 0;
    for (var item in cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }

  void clearCart() {
    cartItems.clear();
  }

  void makePurchase() {
    purchaseHistory.addPurchase(cartItems, getTotal());
    clearCart();
  }

  List<Purchase> getPurchaseHistory() {
    return purchaseHistory.history;
  }
}
