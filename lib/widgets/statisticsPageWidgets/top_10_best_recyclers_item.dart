import 'package:flutter/material.dart';

import '../../helper/colors.dart';

class Top10BestRecyclersItem extends StatelessWidget {
  const Top10BestRecyclersItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          alignment: const Alignment(0, 0),
          width: 70.0,
          height: 70.0,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 140, 131),
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: const Text(
            'A',
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Ajong Trevor',
                style: TextStyle(fontSize: 15.0),
              ),
              SizedBox(height: 8.0),
              Text(
                '500 kg',
                style: TextStyle(fontSize: 12.0, color: AppColors.lightGrey),
              ),
            ],
          ),
        )
      ],
    );
  }
}
