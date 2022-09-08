import 'package:flutter/material.dart';

import '../helper/colors.dart';
import '../widgets/product_item.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({Key? key}) : super(key: key);

  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> with TickerProviderStateMixin {
  int gottenStars = 4;
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return Column(
      children: [
        Container(
          child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              controller: _tabController,
              labelPadding: const EdgeInsets.only(left: 20, right: 20),
              unselectedLabelColor: AppColors.lightGrey,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: const EdgeInsets.only(bottom: 10.0),
              indicatorColor: AppColors.secondaryColor,
              labelColor: Colors.black.withOpacity(0.7),
              tabs: const [
                Tab(text: 'Produits connexes'),
                Tab(text: 'Évaluer'),
              ],
            ),
          ),
        ),
        Container(
          height: 180.0,
          width: double.maxFinite,
          child: TabBarView(
            controller: _tabController,
            children: [
              GridView.builder(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  mainAxisExtent: 180.0,
                ),
                itemBuilder: (context, index) {
                  return const ProductItem();
                },
                itemCount: 2,
              ),
              // const Text('Trevor'),
              Container(
                width: double.maxFinite,
                height: 200.0,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(
                              Icons.star,
                              color: index < gottenStars
                                  ? Colors.yellow
                                  : AppColors.lightGrey,
                            );
                          }),
                        ),
                        const SizedBox(width: 10.0),
                        Text(
                          '(4.0)',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextField(
                      cursorColor: AppColors.lightGrey,
                      style: const TextStyle(fontSize: 12.0),
                      decoration: InputDecoration(
                        label: const Text(
                          "Qu'avez-vous pensez de ce produit ?",
                          style: TextStyle(fontSize: 12.0),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
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
                    Container(
                      alignment: const Alignment(1, 0),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Envoyer',
                          style: TextStyle(color: AppColors.mainColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
