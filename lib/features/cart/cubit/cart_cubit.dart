import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/cart/cubit/cart_state.dart';
import 'package:store_app/features/cart/data/service/cart_service.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  static CartCubit get(context) => BlocProvider.of(context);
  CartService cartService = CartService();

  getAddToCartCubit({required String productId}) {
    emit(CartLoadingState());
    cartService.addCart(productId: productId);
    emit(CartSuccessState());
    getAllProductsCubit();
  }

  getAllProductsCubit() async {
    emit(CartLoadingState());
    var success = await cartService.getCartProducts();
    emit(CartProductsSuccess(cartModel: success));
  }

  cartDeleteCubit({required String productId}) async {
    emit(CartLoadingState());
    await cartService.deleteProduct(productId: productId);
    emit(CartDeleteState());
    getAllProductsCubit();
  }
}
