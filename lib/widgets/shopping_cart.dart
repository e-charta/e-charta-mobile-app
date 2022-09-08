import 'package:flutter/material.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.shopping_cart_rounded),
          tooltip: 'Shopping cart',
        ),
        Container(
          width: 20.0,
          height: 20.0,
          margin: const EdgeInsets.only(left: 25.0, top: 2.0),
          alignment: const Alignment(0, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: Theme.of(context).primaryColor,
          ),
          child: const Text(
            '0',
            style: TextStyle(fontSize: 12.0, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
