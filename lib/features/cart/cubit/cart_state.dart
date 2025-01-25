import 'package:store_app/features/cart/data/model/cart_model.dart';

sealed class CartState {}

final class CartInitial extends CartState {}

final class CartSuccessState extends CartState {}

final class CartLoadingState extends CartState {}

final class CartProductsSuccess extends CartState {
  List<CartModel> cartModel;
  CartProductsSuccess({required this.cartModel});
}

final class CartDeleteState extends CartState {}
