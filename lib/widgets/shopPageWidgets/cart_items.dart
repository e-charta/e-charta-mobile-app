import 'package:flutter/material.dart';

import './cart_item.dart';

class CartItems extends StatelessWidget {
  const CartItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
          width: double.maxFinite,
          height: 80.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 4,
                offset: const Offset(0, 0),
              )
            ],
          ),
          child: const CartItem(),
        );
      },
      itemCount: 10,
    );
  }
}
