import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/shopPageWidgets/product_history_item_page.dart';

class ProductHistoryPage extends StatelessWidget {
  const ProductHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void backToPreviousPage() {}

    double height = MediaQuery.of(context).size.height;
    double statusBar = MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: CustomAppBar(
        appBarText: 'Historique',
        callback: backToPreviousPage,
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              width: double.maxFinite,
              height: (height - statusBar - kToolbarHeight) * 0.15,
              margin: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: const Offset(0, 0),
                  )
                ],
              ),
              child: const ProductHistoryItemPage(),
            );
          }),
    );
  }
}
