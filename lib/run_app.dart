import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/auth/cubit/auth_cubit.dart';
import 'package:store_app/features/auth_login/view/screen/login_screen.dart';
import 'package:store_app/features/cart/cubit/cart_cubit.dart';
import 'package:store_app/features/favorites/cubit/favorite_cubit.dart';
import 'package:store_app/features/home/cubit/home_cubit.dart';
import 'package:store_app/features/profile/cubit/profile_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => ProfileCubit()..getProfileDataCubit(),
        ),
        BlocProvider(
          create: (context) => CartCubit()..getAllProductsCubit(),
        ),
        BlocProvider(
          create: (context) => FavoriteCubit()..getAllFav(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
        home: const LoginScreen(),
      ),
    );
  }
}
