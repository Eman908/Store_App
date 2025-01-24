import 'package:flutter/material.dart';
import 'package:store_app/features/home/view/widgets/tabbar.dart';

AppBar homeAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    title: const Text("Categories"),
    titleTextStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontSize: 24,
    ),
    bottom: homeTabBar(),
  );
}
