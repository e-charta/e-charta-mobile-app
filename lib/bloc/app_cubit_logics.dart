import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './app_cubit.dart';
import './app_state.dart';
import '../pages/onboarding_page.dart';
import '../pages/main_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit, AppState>(builder: (context, state) {
        if (state is AppWelcomeState) {
          return const OnboardingPage();
        } else if (state is AppLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is AppLoadedState) {
          return const MainPage();
        } else {
          return Container();
        }
      }),
    );
  }
}
