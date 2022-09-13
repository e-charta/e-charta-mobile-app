import 'package:flutter/material.dart';

import '../../helper/colors.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
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
      child: GridTile(
        header: InkWell(
          onTap:
              () {}, // TODO: when the image is tap it should open the product detail page
          child: Container(
            width: double.infinity,
            height: 120.0,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              image: DecorationImage(
                  image: AssetImage('assets/images/paper-cup.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
        ),
        child: Container(),
        footer: Container(
          width: double.infinity,
          height: 62.0,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
            color: AppColors.lighterGrey.withOpacity(0.5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                'Gobelet en carton',
                style: TextStyle(fontSize: 12.0),
              ),
              const Text(
                '200 FCFA',
                style: TextStyle(fontSize: 12.0, color: AppColors.lightGrey),
              ),
              SizedBox(
                width: double.maxFinite,
                height: 30.0,
                // color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed:
                          () {}, // TODO: when the heart icon is tapped it should be filled
                      icon: const Icon(
                        Icons.favorite_border_outlined,
                        size: 15.0,
                        color: AppColors.mainColor,
                      ),
                    ),
                    IconButton(
                      onPressed:
                          () {}, // TODO: When the cart icon here is tapped it should diplay on the cart at the top
                      icon: const Icon(
                        Icons.shopping_cart,
                        size: 15.0,
                        color: AppColors.mainColor,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
