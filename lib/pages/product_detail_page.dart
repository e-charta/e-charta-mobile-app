import 'package:flutter/material.dart';

import '../widgets/shopping_cart.dart';
import '../helper/colors.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

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
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    '200 FCFA',
                    style:
                        TextStyle(fontSize: 20.0, color: AppColors.lightGrey),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                width: double.maxFinite,
                height: 80.0,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 2.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed:
                            () {}, // TODO: when the button is pressed it's should decrease the quatity
                        child: const Text(
                          '-',
                          style: TextStyle(color: AppColors.secondaryColor),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.square(25.0),
                          fixedSize: const Size.fromHeight(30.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          backgroundColor: AppColors.lighterGrey,
                        ),
                      ),
                      Container(
                        height: 30.0,
                        width: 60.0,
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            label: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 22.0),
                              child:
                                  const Text('0', textAlign: TextAlign.center),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed:
                            () {}, // TODO: when the button is pressed it's should increase the quatity
                        child: const Text('+'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.square(25.0),
                          fixedSize: const Size.fromHeight(30.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          backgroundColor: AppColors.secondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                width: double.maxFinite,
                height: 120.0,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 2.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10.0, bottom: 4.0, top: 10.0),
                        child: const Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10.0, bottom: 10.0, top: 4.0),
                          child: const Text(
                            'Bienvenue sur e-Charta, une application de collecte des déchets papiers au Cameroun Bienvenue sur e-Charta, une application de collecte des déchets papiers au Cameroun',
                            style: TextStyle(
                                fontSize: 10.0, color: AppColors.lightGrey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Container(
                    height: 200.0,
                    width: double.maxFinite,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                        labelPadding:
                            const EdgeInsets.only(left: 20.0, right: 20.0),
                        controller: _tabController,
                        tabs: const [
                          Tab(
                            text: 'Similar products',
                          ),
                          Tab(
                            text: 'Rate product',
                          ),
                        ],
                      ),
                    ),
                  ),
                  FloatingActionButton.extended(
                    onPressed:
                        () {}, // When this button is pressed in should add the item to the cart
                    label: const Text('Ajouter au panier'),
                    backgroundColor: AppColors.mainColor,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
