import 'package:echarta/pages/login_page.dart';
import 'package:echarta/pages/main_page.dart';
import 'package:flutter/material.dart';

import '../bloc/auth/auth_bloc.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AuthStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AuthStatus.authenticated:
      return [MainPage.page()];
    case AuthStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
