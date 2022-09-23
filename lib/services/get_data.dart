import 'package:firebase_database/firebase_database.dart';

import '../models/product_model.dart';

class GetData {
  final database = FirebaseDatabase.instance.ref();

  Future<void> getProductData() async {
    print('tapped');
    const String productPath = 'Product/';

    // database.child(productPath).set({'name': 'paper bag', 'price': 200});

    database.child(productPath).onValue.listen(
      (event) {
        final products = Map<String, dynamic>.from(event.snapshot.value as Map);
        print(products);
        final product = products['product001'];
        print(product);
        final extractedProducts = ProductDataModel.fromJson(products);
        print(extractedProducts);
      },
    );
  }

  // var baseUrl = 'https://echarta-282b0-default-rtdb.firebaseio.com';
  // Future<List<ProductDataModel>> getData() async {
  //   var apiUrl = '/Product';
  //   http.Response response = await http.get(Uri.parse(baseUrl + apiUrl));
  //   try {
  //     if (response.statusCode == 200) {
  //       final list = json.decode(response.body);
  //       print(list);
  //       return list.map((e) => ProductDataModel.fromJson(e));
  //     } else {
  //       return <ProductDataModel>[];
  //     }
  //   } catch (e) {
  //     return <ProductDataModel>[];
  //   }
  // }
}
