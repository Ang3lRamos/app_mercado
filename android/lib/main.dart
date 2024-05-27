import 'package:flutter/material.dart';
import './model/cart_model.dart';
import './pages/cart_page.dart';
import './pages/home_page.dart';
import './pages/intro_screen.dart';
import "./pages/purchase_history_page.dart";

void main() {
  runApp(
    MaterialApp(
      home: GroceryApp(),
    ),
  );
}

class GroceryApp extends StatefulWidget {
  @override
  _GroceryAppState createState() => _GroceryAppState();
}

class _GroceryAppState extends State<GroceryApp> {
  late CartModel _cartModel;

  @override
  void initState() {
    super.initState();
    _cartModel = CartModel();
  }

  void onStart() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(
          cartModel: _cartModel,
          onAddToCart: addToCart,
          onCartPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartPage(cartModel: _cartModel),
              ),
            );
          },
          onPurchaseHistoryPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    PurchaseHistoryPage(cartModel: _cartModel),
              ),
            );
          },
        ),
      ),
    );
  }

  void addToCart(CartItem item) {
    _cartModel.addToCart(item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grocery Shop'),
      ),
      body: IntroScreen(
        onStart: onStart,
      ),
    );
  }
}
