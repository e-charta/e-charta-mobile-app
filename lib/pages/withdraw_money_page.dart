import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/statisticsPageWidgets/user_balance.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/my_button.dart';

class WithdrawMoneyPage extends StatelessWidget {
  WithdrawMoneyPage({Key? key}) : super(key: key);

  final TextEditingController _amountEditingController =
      TextEditingController();
  final TextEditingController _teleponeEditingController =
      TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double statusBar = MediaQuery.of(context).padding.top;

    void backToPreviousPage() {}
    void openPage() {}

    return Scaffold(
      appBar: CustomAppBar(
        appBarText: 'Récupére mon argent',
        callback: backToPreviousPage,
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: (height -
                        kToolbarHeight -
                        kBottomNavigationBarHeight -
                        statusBar) *
                    0.25,
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                child: const UserBalance(),
              ),
              Container(
                height: (height -
                        kToolbarHeight -
                        kBottomNavigationBarHeight -
                        statusBar) *
                    0.5,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomTextField(
                      editingController: _amountEditingController,
                      icon: Icons.attach_money_rounded,
                      inputType: TextInputType.number,
                      lableText: 'Montant à récupérer',
                    ),
                    CustomTextField(
                      editingController: _teleponeEditingController,
                      icon: Icons.phone,
                      inputType: TextInputType.number,
                      lableText: 'Téléphone',
                    ),
                    CustomTextField(
                      editingController: _passwordEditingController,
                      icon: Icons.key,
                      inputType: TextInputType.visiblePassword,
                      lableText: 'Mot de passe',
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 50.0,
                  vertical: 20.0,
                ),
                width: double.infinity,
                height: 50.0,
                child: MyButton(buttonText: 'Retrait', callBack: openPage),
              )
            ],
          ),
        ),
      ),
    );
  }
}
