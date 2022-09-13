import 'package:flutter/material.dart';

import '../widgets/shopPageWidgets/cart_items.dart';
import '../helper/colors.dart';
import '../widgets/my_button.dart';
import '../widgets/custom_app_bar.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void goToPreviousPage() {}
    void openPage() {}

    return Scaffold(
      appBar:
          CustomAppBar(appBarText: 'Mon Panier', callback: goToPreviousPage),
      body: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            height: (MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    kToolbarHeight) *
                0.75,
            child: const CartItems(),
          ),
          Container(
            height: (MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    kToolbarHeight) *
                0.25,
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: AppColors.lighterGrey,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(40.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: const Offset(0, -2),
                  )
                ]),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Total :',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  const Text(
                    '18000 FCFA',
                    style: TextStyle(
                      fontSize: 25.0,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              MyButton(
                buttonText: 'Vérifier',
                callBack: openPage,
              ),
            ]),
          )
        ],
      ),
    );
  }
}
