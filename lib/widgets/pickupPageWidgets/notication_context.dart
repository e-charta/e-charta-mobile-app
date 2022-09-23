import 'package:flutter/material.dart';

import '../../helper/colors.dart';

class NotificationContent extends StatelessWidget {
  const NotificationContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: (width - 40.0) * 0.15,
          height: 50.0,
          child: const Icon(
            Icons.message,
            color: Colors.white,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: AppColors.mainColor,
          ),
        ),
        SizedBox(
          width: (width - 40.0) * 0.75,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Le saviez-vous?',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Text(
                    '11:40 am',
                    style:
                        TextStyle(fontSize: 10.0, color: AppColors.lightGrey),
                  )
                ],
              ),
              const SizedBox(height: 5.0),
              const Text(
                'Pour avoir une tonne de papiers, il faut couper 17 arbres',
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: AppColors.lightGrey, fontSize: 12.0),
              )
            ],
          ),
        )
      ],
    );
  }
}
