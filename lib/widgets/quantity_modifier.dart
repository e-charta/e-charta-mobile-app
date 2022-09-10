import 'package:flutter/material.dart';

import '../helper/colors.dart';

class QuantityModifier extends StatefulWidget {
  const QuantityModifier({Key? key}) : super(key: key);

  @override
  State<QuantityModifier> createState() => _QuantityModifierState();
}

class _QuantityModifierState extends State<QuantityModifier> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 80.0,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
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
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed:
                () {}, // TODO: when the button is pressed it's should decrease the quatity
            child: const Text(
              '-',
              style: TextStyle(color: AppColors.secondaryColor),
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.square(25.0),
              fixedSize: const Size.fromHeight(30.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              backgroundColor: AppColors.lighterGrey,
            ),
          ),
          Container(
            height: 30.0,
            width: 60.0,
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: const Text('0', textAlign: TextAlign.center),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          ElevatedButton(
            onPressed:
                () {}, // TODO: when the button is pressed it's should increase the quatity
            child: const Text('+'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.square(25.0),
              fixedSize: const Size.fromHeight(30.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              backgroundColor: AppColors.secondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
