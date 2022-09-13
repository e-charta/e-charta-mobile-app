import 'package:flutter/material.dart';

import '../widgets/shopPageWidgets/shopping_cart.dart';
import '../helper/colors.dart';
import '../widgets/shopPageWidgets/my_tab_bar.dart';
import '../widgets/my_button.dart';
import '../widgets/shopPageWidgets/quantity_modifier.dart';
import '../widgets/shopPageWidgets/product_description.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    void openPage() {}

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.maxFinite,
                    height: (height - MediaQuery.of(context).padding.top) * 0.5,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/paper-cup.jpg'),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 55.0, left: 20.0, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_back),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite_border_outlined,
                                color: AppColors.mainColor,
                              ),
                            ),
                            const ShoppingCart(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: const [
                  Text(
                    'Gobelet en carton',
                    style: TextStyle(fontSize: 30.0),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    '200 FCFA',
                    style:
                        TextStyle(fontSize: 20.0, color: AppColors.lightGrey),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              const QuantityModifier(),
              const SizedBox(height: 10.0),
              const ProductDescription(),
              const SizedBox(height: 10.0),
              const MyTabBar(),
              const SizedBox(height: 70.0),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: MyButton(
          buttonText: 'Ajouter au panier',
          callBack: openPage,
        ),
      ),
    );
  }
}
