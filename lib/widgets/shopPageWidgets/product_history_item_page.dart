import 'package:flutter/material.dart';

import '../../helper/colors.dart';

class ProductHistoryItemPage extends StatelessWidget {
  const ProductHistoryItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: (width - 40) * 0.25,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/paper-cup.jpg'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0),
            ),
          ),
        ),
        SizedBox(
          width: (width - 40) * 0.75,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 59.8,
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                color: AppColors.lighterGrey.withOpacity(0.2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Sac en papier',
                          style: TextStyle(fontSize: 15.0),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          '500 FCFA x 4',
                          style: TextStyle(
                              fontSize: 12.0, color: AppColors.lightGrey),
                        ),
                      ],
                    ),
                    Container(
                      width: 80,
                      height: 30,
                      alignment: const Alignment(0, 0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(186, 135, 211, 167),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Text(
                        'En cours',
                        style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.white.withOpacity(0.8)),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 30.0,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  color: AppColors.lighterGrey.withOpacity(0.8),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(10.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Août 28,2022',
                      style: TextStyle(
                        fontSize: 8.0,
                        color: AppColors.lightGrey,
                      ),
                    ),
                    Text(
                      'Orange Money',
                      style: TextStyle(
                        fontSize: 8.0,
                        color: AppColors.lightGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
