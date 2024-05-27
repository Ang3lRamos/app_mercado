  import 'package:flutter/material.dart';
  import '../model/cart_model.dart';

  class PurchaseHistoryPage extends StatelessWidget {
    final CartModel cartModel;

    const PurchaseHistoryPage({Key? key, required this.cartModel})
        : super(key: key);

    @override
    Widget build(BuildContext context) {
      final List<Purchase> purchaseHistory = cartModel.getPurchaseHistory();
      print(purchaseHistory); // Verifica el historial de compras en la consola

      return Scaffold(
        appBar: AppBar(
          title: Text('Purchase History'),
        ),
        body: ListView.builder(
          itemCount: purchaseHistory.length,
          itemBuilder: (context, index) {
            final purchase = purchaseHistory[index];
            return ListTile(
              title: Text('Purchase ${index + 1}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total: \$${purchase.total.toStringAsFixed(2)}'),
                  Text('Date: ${purchase.timestamp.toString()}'),
                  SizedBox(height: 8),
                  Text('Items:'),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: purchase.items.length,
                    itemBuilder: (context, itemIndex) {
                      final item = purchase.items[itemIndex];
                      return ListTile(
                        leading: Image.network(
                          item.imageUrl,
                          width: 50,
                          height: 50,
                        ),
                        title: Text('${item.name} x ${item.quantity}'),
                        subtitle: Text(
                            '\$${(item.price * item.quantity).toStringAsFixed(2)}'),
                      );
                    },
                  ),
                  Divider(),
                ],
              ),
            );
          },
        ),
      );
    }
  }
