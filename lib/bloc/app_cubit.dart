import 'package:bloc/bloc.dart';

import './app_state.dart';
import '../services/get_data.dart';
import '../models/product_model.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({required this.data}) : super(AppInitialState()) {
    emit(AppWelcomeState());
  }

  final GetData data;
  late final List<ProductDataModel> products;
  void getData() async {
    try {
      emit(AppLoadingState());
      // products = await data.getData();
      // print(products);
      final toBePrinted = data.getProductData();
      // print(toBePrinted);
      emit(AppLoadedState(products: products));
    } catch (error) {
      // print(error);
    }
  }
}
