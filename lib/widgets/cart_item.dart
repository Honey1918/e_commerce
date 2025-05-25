import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback onRemove;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  CartItemWidget({
    required this.item,
    required this.onRemove,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(item['image'], height: 40),
      title: Text(item['title'], maxLines: 1),
      subtitle: Text('Qty: ${item['quantity']}  |  \$${item['price']}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(icon: Icon(Icons.remove), onPressed: onDecrement),
          IconButton(icon: Icon(Icons.add), onPressed: onIncrement),
          IconButton(icon: Icon(Icons.delete), onPressed: onRemove),
        ],
      ),
    );
  }
}