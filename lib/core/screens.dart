import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/home/cubit/home_cubit.dart';
import 'package:store_app/features/home/cubit/home_state.dart';
import 'package:store_app/features/home/view/screen/home_screen.dart';
import 'package:store_app/features/home/view/widgets/bottom_bar.dart';
import 'package:store_app/features/profile/view/screen/profile_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final List<Widget> pages = [
    const HomeScreen(),
    const Center(child: Text("hole")),
    const Center(child: Text("hole")),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        HomeCubit cubit = BlocProvider.of(context);
        return Scaffold(
          body: pages[cubit.currentIndex],
          bottomNavigationBar: homeBottomBar(cubit: cubit),
        );
      },
    );
  }
}
