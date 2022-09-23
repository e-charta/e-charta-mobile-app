import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/custom_app_bar.dart';
import '../helper/colors.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/my_button.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _firstNameEditingController =
      TextEditingController();

  final TextEditingController _lastNameEditingController =
      TextEditingController();

  final TextEditingController _emailEditingController = TextEditingController();

  final TextEditingController _telephoneEditingController =
      TextEditingController();

  final TextEditingController _locationEditingController =
      TextEditingController();

  final TextEditingController _passwordEditingController =
      TextEditingController();

  final TextEditingController _confirmPasswordEditingController =
      TextEditingController();

  final _pageController = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double statusBar = MediaQuery.of(context).padding.top;

    void backToPreviousPage() {}
    void openPage() {}
    void nextSlid() {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }

    return Scaffold(
      appBar: CustomAppBar(
          appBarText: 'Créer un compte', callback: backToPreviousPage),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SizedBox(
            height: (height - statusBar - kToolbarHeight) * 1,
            child: Stack(children: <Widget>[
              PageView(
                onPageChanged: (index) {
                  setState(() => isLastPage = index == 2);
                },
                controller: _pageController,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: (height - statusBar - kToolbarHeight) * 0.3,
                      bottom: (height - statusBar - kToolbarHeight) * 0.48,
                      left: 20.0,
                      right: 20.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextField(
                          editingController: _firstNameEditingController,
                          icon: Icons.person,
                          inputType: TextInputType.text,
                          lableText: 'Prénom',
                        ),
                        CustomTextField(
                          editingController: _lastNameEditingController,
                          icon: Icons.person,
                          inputType: TextInputType.text,
                          lableText: 'Nom de famille',
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: (height - statusBar - kToolbarHeight) * 0.25,
                      bottom: (height - statusBar - kToolbarHeight) * 0.4,
                      left: 20.0,
                      right: 20.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextField(
                          editingController: _emailEditingController,
                          icon: Icons.mail,
                          inputType: TextInputType.emailAddress,
                          lableText: 'Adresse e-mail',
                        ),
                        CustomTextField(
                          editingController: _telephoneEditingController,
                          icon: Icons.phone,
                          inputType: TextInputType.number,
                          lableText: 'Téléphone',
                        ),
                        CustomTextField(
                          editingController: _locationEditingController,
                          icon: Icons.place,
                          inputType: TextInputType.text,
                          lableText: 'Adresse',
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: (height - statusBar - kToolbarHeight) * 0.3,
                      bottom: (height - statusBar - kToolbarHeight) * 0.48,
                      left: 20.0,
                      right: 20.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextField(
                          editingController: _passwordEditingController,
                          icon: Icons.key,
                          inputType: TextInputType.visiblePassword,
                          lableText: 'Mot de passe',
                        ),
                        CustomTextField(
                          editingController: _confirmPasswordEditingController,
                          icon: Icons.key,
                          inputType: TextInputType.visiblePassword,
                          lableText: 'Confirmez le mot de passe',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: (height - statusBar - kToolbarHeight) * 0.3,
                width: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Créer un compte',
                      style: TextStyle(
                          fontSize: 25.0, color: Colors.black.withOpacity(0.8)),
                    ),
                    const Text(
                      'Créer un nouveau compte',
                      style:
                          TextStyle(fontSize: 12.0, color: AppColors.lightGrey),
                    )
                  ],
                ),
              ),
              Container(
                alignment: const Alignment(0, 0.4),
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  axisDirection: Axis.horizontal,
                  effect: SlideEffect(
                    dotColor: Colors.grey.withOpacity(0.3),
                    activeDotColor: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: (height - statusBar - kToolbarHeight) * 0.75),
                height: 50.0,
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: MyButton(
                    buttonText: isLastPage ? 'Créer un compte' : 'Suivant',
                    callBack: nextSlid),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
