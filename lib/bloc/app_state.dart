import 'package:equatable/equatable.dart';

import '../models/product_model.dart';

abstract class AppState extends Equatable {
  @override
  List<Object> get props => [];
}

class AppInitialState extends AppState {}

class AppWelcomeState extends AppState {}

class AppLoadingState extends AppState {}

class AppLoadedState extends AppState {
  AppLoadedState({required this.products});

  final List<ProductDataModel> products;
  @override
  List<Object> get props => [products];
}
