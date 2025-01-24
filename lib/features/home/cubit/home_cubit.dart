import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/home/cubit/home_state.dart';
import 'package:store_app/features/home/data/service/products_service.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  ProductsService productsService = ProductsService();

  int currentIndex = 0;
  changeIndex(int value) {
    currentIndex = value;
    emit(UpdateIndex());
  }

  getProductsDataCubit({required String endPoint}) async {
    emit(ProductsLoadingState());
    var success = await productsService.productsData(endPoint: endPoint);
    emit(ProductsSuccessState(productsModel: success));
  }

  getLaptopsDataCubit() async {
    emit(LaptopLoadingState());
    var success = await productsService.laptopsData();
    emit(LaptopSuccessState(lapModel: success));
  }
}
