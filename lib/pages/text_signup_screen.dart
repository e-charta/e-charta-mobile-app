import 'package:echarta/cubit/signup/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/login/login_cubit.dart';
import '../services/auth_repository.dart';
import '../helper/colors.dart';

class TextSignupScreen extends StatelessWidget {
  const TextSignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
            child: BlocProvider<SignupCubit>(
          create: (_) => SignupCubit(
            context.read<AuthRepository>(),
          ),
          child: SignupSceen(),
        )),
      ),
    );
  }
}

class SignupSceen extends StatelessWidget {
  final TextEditingController _emailFieldController = TextEditingController();
  final TextEditingController _passwordFieldController =
      TextEditingController();
  SignupSceen({Key? key}) : super(key: key);
  void openPage() {}

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double statusBar = MediaQuery.of(context).padding.top;
    return BlocListener<SignupCubit, SignupState>(
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
                BlocBuilder<SignupCubit, SignupState>(
                  buildWhen: (previous, current) =>
                      previous.email != current.email,
                  builder: (context, state) {
                    return TextField(
                      onChanged: (email) {
                        context.read<SignupCubit>().emailChanged(email);
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
                BlocBuilder<SignupCubit, SignupState>(
                  buildWhen: (previous, current) =>
                      previous.password != current.password,
                  builder: (context, state) {
                    return TextField(
                      obscureText: true,
                      onChanged: (password) {
                        context.read<SignupCubit>().emailChanged(password);
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
                BlocBuilder<SignupCubit, SignupState>(
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
                              context.read<SignupCubit>().sigupFormSubmitted();
                            },
                            child: const Text('Signup'),
                          );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
