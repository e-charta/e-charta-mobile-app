import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_text_field.dart';
import '../helper/colors.dart';
import '../widgets/my_button.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailFieldController = TextEditingController();
  final TextEditingController _passwordFieldController =
      TextEditingController();
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double statusBar = MediaQuery.of(context).padding.top;

    void backToPreviousPage() {}
    void openPage() {}

    return Scaffold(
      appBar:
          CustomAppBar(appBarText: 'Connexion', callback: backToPreviousPage),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: (height - statusBar - kToolbarHeight) * 0.4,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/login-icon.png'),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                height: (height - statusBar - kToolbarHeight) * 0.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomTextField(
                      editingController: _emailFieldController,
                      icon: Icons.email,
                      inputType: TextInputType.emailAddress,
                      lableText: 'E-mail',
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextField(
                      editingController: _passwordFieldController,
                      icon: Icons.key,
                      inputType: TextInputType.visiblePassword,
                      lableText: 'Mot de passe',
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Mot de passe oublié',
                        style: TextStyle(color: AppColors.mainColor),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: (height - statusBar - kToolbarHeight) * 0.3,
                child: Column(
                  children: [
                    Container(
                      width: double.maxFinite,
                      height: 50.0,
                      margin: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 20.0),
                      child:
                          MyButton(buttonText: 'Connexion', callBack: openPage),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "vous n'avez pas de compte ?",
                          style: TextStyle(fontSize: 12.0),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Créer un compte',
                            style: TextStyle(
                              color: AppColors.mainColor,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ],
                    )
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
