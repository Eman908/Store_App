import 'package:flutter/material.dart';
import 'package:store_app/features/cart/data/model/cart_model.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key, required this.cp, required this.onPressed});
  final CartModel cp;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.delete_forever,
          size: 28,
          color: Colors.redAccent,
        ),
      ),
      leading: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: NetworkImage(cp.image),
          ),
        ),
      ),
      title: Text(
        cp.name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        "Price : ${cp.price} | Quantity : ${cp.quantity}",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
