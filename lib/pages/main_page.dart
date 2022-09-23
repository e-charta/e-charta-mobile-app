import 'package:flutter/material.dart';

import './navpages/account_page.dart';
import 'navpages/pickup_page.dart';
import './navpages/statistics_page.dart';
import './navpages/shop_page.dart';
import '../helper/colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  static Page page() => const MaterialPage<void>(child: MainPage());

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> pages = [
    const ShopPage(),
    const PickupPage(),
    const StatisticsPage(),
    const AccountPage(),
  ];

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: AppColors.lightGrey,
        onTap: onTap,
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront_outlined),
            label: 'Boutique',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.recycling_outlined),
            label: 'Recyclage',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_rounded),
            label: 'Statistiques',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: 'Compte',
          ),
        ],
      ),
    );
  }
}
