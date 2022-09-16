import 'package:flutter/material.dart';

import '../../helper/colors.dart';
import '../../widgets/my_button.dart';

class EvaluateIndividualAgent extends StatelessWidget {
  const EvaluateIndividualAgent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _commentEditingController =
        TextEditingController();
    int gottenStars = 4;

    void openPage() {
      print('Comment: ${_commentEditingController.text}');
      print('Star: $gottenStars');
    }

    void showAlertDialogBox(BuildContext context) async {
      return showDialog(
          context: context,
          builder: (context) {
            return GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(
                              Icons.star,
                              color: index < gottenStars
                                  ? Colors.yellow
                                  : AppColors.lightGrey,
                            );
                          }),
                        ),
                        const SizedBox(width: 10.0),
                        Text(
                          '(4.0)',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      controller: _commentEditingController,
                      cursorColor: AppColors.lightGrey,
                      style: const TextStyle(fontSize: 12.0),
                      decoration: InputDecoration(
                        label: const Text(
                          "Qu'avez-vous pensez du service ?",
                          style: TextStyle(fontSize: 12.0),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        filled: true,
                        fillColor: AppColors.lighterGrey,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.transparent, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.mainColor.withOpacity(0.5),
                              width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: openPage,
                    child: const Text(
                      'Valider',
                      style: TextStyle(color: AppColors.mainColor),
                    ),
                  ),
                ],
              ),
            );
          });
    }

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
              MyButton(
                  buttonText: 'Valider',
                  callBack: () => showAlertDialogBox(context)),
            ],
          ),
        ),
        Container(
          height: 20.0,
          alignment: const Alignment(0, 0),
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
