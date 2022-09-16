import 'package:flutter/material.dart';

import '../../helper/colors.dart';

class UserBalance extends StatelessWidget {
  const UserBalance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Solde',
          style: TextStyle(
            color: AppColors.lightGrey,
            fontSize: 18.0,
          ),
        ),
        const SizedBox(height: 10.0),
        Text(
          '0.0 FCFA',
          style:
              TextStyle(fontSize: 40.0, color: Colors.black.withOpacity(0.8)),
        ),
        const Text(
          'Mis à jour le 24 Août 2022',
          style: TextStyle(
            fontSize: 10.0,
            color: AppColors.lightGrey,
          ),
        ),
      ],
    );
  }
}
