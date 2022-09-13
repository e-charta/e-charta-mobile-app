import 'package:flutter/material.dart';

import '../../helper/colors.dart';
import '../../widgets/my_button.dart';

class EvaluateIndividualAgent extends StatelessWidget {
  const EvaluateIndividualAgent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void openPage() {}

    return Column(
      children: [
        Container(
          height: 70.0,
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          width: double.maxFinite,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Ajong Trevor'),
                  SizedBox(height: 10.0),
                  Text(
                    '2 kg',
                    style: TextStyle(color: AppColors.lightGrey),
                  ),
                ],
              ),
              MyButton(buttonText: 'Valider', callBack: openPage),
            ],
          ),
        ),
        Container(
          height: 20.0,
          alignment: Alignment(0, 0),
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: AppColors.lighterGrey.withOpacity(0.5),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
          ),
          child: const Text(
            'Août 27,2022',
            style: TextStyle(fontSize: 10.0, color: AppColors.lightGrey),
          ),
        ),
      ],
    );
  }
}
