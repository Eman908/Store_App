import 'package:flutter/material.dart';
import 'package:store_app/features/home/cubit/home_cubit.dart';

BottomNavigationBar homeBottomBar({required HomeCubit cubit}) {
  return BottomNavigationBar(
    currentIndex: cubit.currentIndex,
    onTap: (value) {
      cubit.changeIndex(value);
    },
    type: BottomNavigationBarType.fixed,
    elevation: 20,
    selectedItemColor: Colors.blueGrey,
    unselectedItemColor: Colors.grey,
    //backgroundColor: Colors.white,
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
      BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
    ],
  );
}
