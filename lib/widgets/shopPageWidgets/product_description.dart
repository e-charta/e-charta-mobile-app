import 'package:flutter/material.dart';

import '../../helper/colors.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 120.0,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
                left: 10.0, right: 10.0, bottom: 4.0, top: 10.0),
            child: const Text(
              'Description',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                  left: 10.0, right: 10.0, bottom: 10.0, top: 4.0),
              child: const Text(
                'Bienvenue sur e-Charta, une application de collecte des déchets papiers au Cameroun Bienvenue sur e-Charta, une application de collecte des déchets papiers au Cameroun',
                style: TextStyle(fontSize: 10.0, color: AppColors.lightGrey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
