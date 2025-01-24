import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/home/cubit/home_cubit.dart';
import 'package:store_app/features/home/cubit/home_state.dart';
import 'package:store_app/features/home/view/widgets/product_success_widgets.dart';

class ProductsBuilder extends StatelessWidget {
  const ProductsBuilder({super.key, required this.endPoint});
  final String endPoint;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCubit()..getProductsDataCubit(endPoint: endPoint),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is ProductsSuccessState) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GridView.count(
                //physics: const BouncingScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                childAspectRatio: 0.7,
                children: List.generate(
                  state.productsModel.length,
                  (index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigator.of(context)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return ProductDescription(
                        //       productsModel: state.productData[index]);
                        // }));
                      },
                      child: ProductSuccessWidget(
                        productsModel: state.productsModel[index],
                      ),
                    );
                  },
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
