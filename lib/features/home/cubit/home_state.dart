import 'package:store_app/features/home/data/model/laptop_model.dart';
import 'package:store_app/features/home/data/model/products_model.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class UpdateIndex extends HomeState {}

final class ProductsSuccessState extends HomeState {
  final List<ProductsModel> productsModel;
  ProductsSuccessState({required this.productsModel});
}

final class LaptopSuccessState extends HomeState {
  final List<LaptopModel> lapModel;
  LaptopSuccessState({required this.lapModel});
}

final class ProductsLoadingState extends HomeState {}

final class LaptopLoadingState extends HomeState {}
