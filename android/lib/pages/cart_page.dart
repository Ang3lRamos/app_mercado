import 'package:flutter/material.dart';
import '../model/cart_model.dart';

class CartPage extends StatelessWidget {
  final CartModel cartModel;

  const CartPage({Key? key, required this.cartModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito de Compras'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartModel.cartItems.length,
              itemBuilder: (context, index) {
                final item = cartModel.cartItems[index];
                return ListTile(
                  leading: Image.network(
                    item.imageUrl,
                    width: 50,
                    height: 50,
                  ),
                  title: Text('${item.name} x ${item.quantity}'),
                  subtitle: Text('\$${(item.price * item.quantity).toStringAsFixed(2)}'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${cartModel.getTotal().toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Pago realizado'),
                    content: Text('¡Gracias por tu compra!'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop(); // Regresar al inicio después de aceptar el pago
                          cartModel.clearCart(); // Limpiar el carrito después del pago
                        },
                        child: Text('Aceptar'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text('Realizar Pago'),
          ),
        ],
      ),
    );
  }
}
