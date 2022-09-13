import 'package:flutter/material.dart';

import './product_item.dart';

class ProductItems extends StatelessWidget {
  const ProductItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        mainAxisExtent: 180.0,
      ),
      itemBuilder: (context, index) {
        return const ProductItem();
      },
      itemCount: 10,
    );
  }
}
