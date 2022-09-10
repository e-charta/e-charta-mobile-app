import 'package:flutter/material.dart';

import './helper/colors.dart';
// import '../pages/product_detail_page.dart';
// import './pages/main_page.dart';
// import './pages/onboarding_page.dart';
// import './pages/cart_page.dart';
import './pages/place_order_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: AppColors.mainColor,
        fontFamily: 'Montserrat',
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.black.withOpacity(0.7),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(
            fontSize: 18.0,
            color: Colors.black.withOpacity(0.7),
            fontFamily: 'Montserrat',
          ),
        ),
      ),
      home: const PlaceOrderPage(),
    );
  }
}
