import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/home/cubit/home_cubit.dart';
import 'package:store_app/features/home/cubit/home_state.dart';
import 'package:store_app/features/home/view/widgets/home_appbar.dart';
import 'package:store_app/features/home/view/widgets/laptop_builder.dart';
import 'package:store_app/features/home/view/widgets/products_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Scaffold(
            appBar: homeAppBar(),
            body: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 24),
              child: TabBarView(
                children: [
                  ProductsBuilder(endPoint: 'electronics'),
                  LaptopBuilder(),
                  ProductsBuilder(endPoint: 'jewelery'),
                  ProductsBuilder(endPoint: "men's%20clothing"),
                  ProductsBuilder(endPoint: "women's%20clothing"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
