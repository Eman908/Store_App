import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/home/cubit/home_cubit.dart';
import 'package:store_app/features/home/cubit/home_state.dart';
import 'package:store_app/features/home/view/widgets/laptop_success.dart';

class LaptopBuilder extends StatelessWidget {
  const LaptopBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getLaptopsDataCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is LaptopSuccessState) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GridView.count(
                //physics: const BouncingScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                childAspectRatio: 0.7,
                children: List.generate(
                  state.lapModel.length,
                  (index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigator.of(context)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return ProductDescription(
                        //       productsModel: state.productData[index]);
                        // }));
                      },
                      child: LaptopSuccess(
                        laptopModel: state.lapModel[index],
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
