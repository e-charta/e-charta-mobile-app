import 'package:flutter/material.dart';

import '../helper/colors.dart';

class MyButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback callBack;
  const MyButton({required this.buttonText, required this.callBack});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: callBack,
      label: Text(buttonText),
      backgroundColor: AppColors.mainColor,
    );
  }
}
