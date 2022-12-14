import 'package:echarta/pages/text_signup_screen.dart';
import 'package:echarta/services/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_text_field.dart';
import '../helper/colors.dart';
import '../widgets/my_button.dart';
import '../cubit/login/login_cubit.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  static Page page() => MaterialPage<void>(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    void backToPreviousPage() {}

    return Scaffold(
      appBar:
          CustomAppBar(appBarText: 'Connexion', callback: backToPreviousPage),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
            child: BlocProvider<LoginCubit>(
          create: (_) => LoginCubit(
            context.read<AuthRepository>(),
          ),
          child: LoginSceen(),
        )),
      ),
    );
  }
}

class LoginSceen extends StatelessWidget {
  final TextEditingController _emailFieldController = TextEditingController();
  final TextEditingController _passwordFieldController =
      TextEditingController();
  LoginSceen({Key? key}) : super(key: key);
  void openPage() {}

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double statusBar = MediaQuery.of(context).padding.top;
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.error) {
          // Do something if there is an error.
        }
      },
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
            height: (height - statusBar - kToolbarHeight) * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BlocBuilder<LoginCubit, LoginState>(
                  buildWhen: (previous, current) =>
                      previous.email != current.email,
                  builder: (context, state) {
                    return TextField(
                      onChanged: (email) {
                        context.read<LoginCubit>().emailChanged(email);
                      },
                      decoration: InputDecoration(
                        labelText: 'email',
                        labelStyle: TextStyle(
                          color: Colors.black.withOpacity(0.3),
                          fontSize: 12.0,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        prefixIcon: const Icon(
                          Icons.email,
                          color: AppColors.secondaryColor,
                          size: 16.0,
                        ),
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
                    );
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                BlocBuilder<LoginCubit, LoginState>(
                  buildWhen: (previous, current) =>
                      previous.password != current.password,
                  builder: (context, state) {
                    return TextField(
                      onChanged: (password) {
                        context.read<LoginCubit>().emailChanged(password);
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Colors.black.withOpacity(0.3),
                          fontSize: 12.0,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        prefixIcon: const Icon(
                          Icons.key,
                          color: AppColors.secondaryColor,
                          size: 16.0,
                        ),
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
                    );
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                BlocBuilder<LoginCubit, LoginState>(
                  buildWhen: (previous, current) =>
                      previous.status != current.status,
                  builder: (context, state) {
                    return state.status == LoginStatus.submitting
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(200, 40),
                            ),
                            onPressed: () {
                              context.read<LoginCubit>().loginWithCredentials();
                            },
                            child: const Text('Login'),
                          );
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(200, 40),
                  ),
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const TextSignupScreen(),
                    ),
                  ),
                  child: const Text('signup'),
                ),
                //       const SizedBox(
                //         height: 20.0,
                //       ),
                //       CustomTextField(
                //         editingController: _passwordFieldController,
                //         icon: Icons.key,
                //         inputType: TextInputType.visiblePassword,
                //         lableText: 'Mot de passe',
                //       ),
                //       TextButton(
                //         onPressed: () {},
                //         child: const Text(
                //           'Mot de passe oubli?? ?',
                //           style: TextStyle(color: AppColors.mainColor),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: (height - statusBar - kToolbarHeight) * 0.3,
                //   child: Column(
                //     children: [
                //       Container(
                //         width: double.maxFinite,
                //         height: 50.0,
                //         margin:
                //             const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                //         child: MyButton(buttonText: 'Connexion', callBack: openPage),
                //       ),
                //       const SizedBox(
                //         height: 5.0,
                //       ),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           const Text(
                //             "vous n'avez pas de compte ?",
                //             style: TextStyle(fontSize: 10.0),
                //           ),
                //           TextButton(
                //             onPressed: () {},
                //             child: const Text(
                //               'Cr??er un compte',
                //               style: TextStyle(
                //                 color: AppColors.mainColor,
                //                 fontSize: 10.0,
                //               ),
                //             ),
                //           ),
                //         ],
                //       )
              ],
            ),
          )
        ],
      ),
    );
  }
}
