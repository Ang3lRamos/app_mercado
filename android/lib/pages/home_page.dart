import 'package:flutter/material.dart';
import '../components/grocery_item_tile.dart';
import '../model/cart_model.dart';
import '../pages/purchase_history_page.dart';

class HomePage extends StatelessWidget {
  final CartModel cartModel;
  final Function(CartItem) onAddToCart;
  final VoidCallback onCartPressed;
  final VoidCallback onPurchaseHistoryPressed;

  const HomePage({
    Key? key,
    required this.cartModel,
    required this.onAddToCart,
    required this.onCartPressed,
    required this.onPurchaseHistoryPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grocery Shop'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: onCartPressed,
          ),
          IconButton(
            icon: Icon(Icons.history),
            onPressed: onPurchaseHistoryPressed,
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8),
        children: [
          GroceryItemTile(
            name: 'Aguacate',
            imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvGbz4o6tzz8sz9A3O_3Kw_MobVWmYlzVMXdUyp9jn1g&s',
            price: 2.50,
            onPressed: () {
              onAddToCart(CartItem(
                name: 'Aguacate',
                imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvGbz4o6tzz8sz9A3O_3Kw_MobVWmYlzVMXdUyp9jn1g&s',
                price: 2.50,
              ));
            },
          ),
          GroceryItemTile(
            name: 'Plátano',
            imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnRMeg_iggVbWzqUHdMfemmR5kXZK35MlOOyhqkzxb8A&s',
            price: 1.20,
            onPressed: () {
              onAddToCart(CartItem(
                name: 'Plátano',
                imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnRMeg_iggVbWzqUHdMfemmR5kXZK35MlOOyhqkzxb8A&s',
                price: 1.20,
              ));
            },
          ),
          GroceryItemTile(
            name: 'Pollo',
            imageUrl:
            'https://d1cft8rz0k7w99.cloudfront.net/n/c/b/a/4/cba40914ee88a5912d4c9c8a3f0b5df280202c7d_Poultry_352871_01.jpg',
            price: 5.75,
            onPressed: () {
              onAddToCart(CartItem(
                name: 'Pollo',
                imageUrl:
                'https://d1cft8rz0k7w99.cloudfront.net/n/c/b/a/4/cba40914ee88a5912d4c9c8a3f0b5df280202c7d_Poultry_352871_01.jpg',
                price: 5.75,
              ));
            },
          ),
          GroceryItemTile(
            name: 'Queso',
            imageUrl:
            'https://www.cocinista.es/download/bancorecursos/recetas/receta-queso-camembert.jpg',
            price: 0.80,
            onPressed: () {
              onAddToCart(CartItem(
                name: 'Queso',
                imageUrl:
                'https://www.cocinista.es/download/bancorecursos/recetas/receta-queso-camembert.jpg',
                price: 0.80,
              ));
            },
          ),
          GroceryItemTile(
            name: 'Fresa',
            imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeCNLngUnZe-IaFzetNlS6LdpHNrLRT85GZgT0yzOInA&s',
            price: 1.00,
            onPressed: () {
              cartModel.addToCart(CartItem(
                name: 'Fresa',
                imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeCNLngUnZe-IaFzetNlS6LdpHNrLRT85GZgT0yzOInA&s',
                price: 1.00,
              ));
            },
          ),
          GroceryItemTile(
            name: 'Manzana',
            imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSr3-JM862szucALsMlAMKQbCk_IiGjEzkIF1RHf8QX8Q&s',
            price: 1.00,
            onPressed: () {
              cartModel.addToCart(CartItem(
                name: 'Manzana',
                imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSr3-JM862szucALsMlAMKQbCk_IiGjEzkIF1RHf8QX8Q&s',
                price: 1.00,
              ));
            },
          ),
          GroceryItemTile(
            name: 'Durazno',
            imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdC-rJHnk4QpjyniH7gd3XwK-Q5rmFAZTZeR0qNvNulw&s',
            price: 1.00,
            onPressed: () {
              cartModel.addToCart(CartItem(
                name: 'Durazno',
                imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdC-rJHnk4QpjyniH7gd3XwK-Q5rmFAZTZeR0qNvNulw&s',
                price: 1.00,
              ));
            },
          ),
          // Agrega más GroceryItemTiles aquí según sea necesario
        ],
      ),
    );
  }
}


