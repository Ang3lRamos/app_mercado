import 'package:flutter/material.dart';
import '../model/cart_model.dart';
import '../pages/intro_screen.dart'; // Importa la página de inicio

class PaymentPage extends StatelessWidget {
  final CartModel cartModel;

  const PaymentPage({Key? key, required this.cartModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Realizar Pago'),
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
                  title: Text(item.name),
                  subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
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
                          // Navegar de vuelta a la pantalla de inicio después de aceptar el pago
                          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
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
