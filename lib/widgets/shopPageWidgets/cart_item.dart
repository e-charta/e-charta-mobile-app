import 'package:flutter/material.dart';

import '../../helper/colors.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: (MediaQuery.of(context).size.width - 40) * 0.25,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/paper-cup.jpg'),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0),
            ),
          ),
        ),
        Container(
          width: (MediaQuery.of(context).size.width - 40) * 0.60,
          color: AppColors.lighterGrey.withOpacity(0.4),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Gobelet en carton',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    '200 FCFA',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ]),
          ),
        ),
        Container(
          width: (MediaQuery.of(context).size.width - 40) * 0.15,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
            color: AppColors.lighterGrey.withOpacity(0.4),
          ),
          child: Column(
            children: [
              Container(
                width: 20.0,
                height: 20.0,
                margin: const EdgeInsets.symmetric(vertical: 5.0),
                decoration: BoxDecoration(
                    color: AppColors.lightGrey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(5.0)),
                child: const Text(
                  '-',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.secondaryColor),
                ),
              ),
              const Text(
                '1',
                style: TextStyle(fontSize: 10.0),
              ),
              Container(
                width: 20.0,
                height: 20.0,
                margin: const EdgeInsets.symmetric(vertical: 5.0),
                decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(5.0)),
                child: const Text(
                  '+',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
