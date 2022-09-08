import 'package:flutter/material.dart';

import '../helper/colors.dart';

class MyButton extends StatelessWidget {
  const MyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {},
      label: const Text('Ajouter au panier'),
      backgroundColor: AppColors.mainColor,
    );
  }
}
