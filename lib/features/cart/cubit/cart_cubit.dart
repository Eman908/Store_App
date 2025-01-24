import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/cart/cubit/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
}
