import 'package:flutter/material.dart';

class GroceryItemTile extends StatelessWidget {
  final String name;
  final String imageUrl;
  final double price;
  final VoidCallback onPressed;

  const GroceryItemTile({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: SizedBox(
          width: 60,
          height: 60,
          child: Image.network(imageUrl, fit: BoxFit.cover),
        ),
        title: Text(
          name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('\$$price'),
        trailing: IconButton(
          icon: Icon(Icons.add_shopping_cart),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
