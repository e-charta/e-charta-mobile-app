import 'package:flutter/material.dart';

import './cart_item.dart';

class CartItems extends StatelessWidget {
  const CartItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: (MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top -
              kToolbarHeight) *
          0.73,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return const CartItem();
        },
        itemCount: 10,
      ),
    );
  }
}
