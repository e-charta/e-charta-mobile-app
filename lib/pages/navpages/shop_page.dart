import 'package:flutter/material.dart';

import '../../helper/colors.dart';
import '../../widgets/product_items.dart';
import '../../widgets/shopping_cart.dart';

// enum FilterOptions {
//   Historique,
//   Favori,
// }

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double statusBar = MediaQuery.of(context).padding.top;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        primary: true,
        appBar: AppBar(
          title: const Text('ChartaMarket'),
          actions: [
            const ShoppingCart(),
            PopupMenuButton(
              elevation: 5,
              // onSelected: () {},
              icon: const Icon(
                Icons.more_vert,
              ),
              itemBuilder: (_) => [
                PopupMenuItem(
                  child: const Text('Historique'),
                  // value: FilterOptions.Favorites,
                  onTap: () {},
                ),
                PopupMenuItem(
                  child: const Text('Favori'),
                  // value: FilterOptions.All,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 10.0),
              Container(
                height: (height -
                        statusBar -
                        kToolbarHeight -
                        kBottomNavigationBarHeight) *
                    0.10,
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  style: const TextStyle(fontSize: 12.0),
                  keyboardType: TextInputType.text,
                  cursorColor: AppColors.lightGrey,
                  decoration: InputDecoration(
                    labelText: 'Rechercher un produit...',
                    labelStyle: TextStyle(
                      color: Colors.black.withOpacity(0.3),
                      fontSize: 12.0,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    prefixIcon: const Icon(
                      Icons.search,
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
                ),
              ),
              const SizedBox(height: 20.0),
              const ProductItems(),
            ],
          ),
        ),
      ),
    );
  }
}
