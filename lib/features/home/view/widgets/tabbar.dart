import 'package:flutter/material.dart';

TabBar homeTabBar() {
  return const TabBar(
    tabAlignment: TabAlignment.start,
    indicatorWeight: 2,
    labelColor: Colors.black,
    indicatorColor: Colors.deepOrange,
    unselectedLabelColor: Colors.grey,
    isScrollable: true,
    tabs: [
      Tab(
        text: "Electronics",
      ),
      Tab(
        text: "Laptops",
      ),
      Tab(
        text: "Jewelery",
      ),
      Tab(
        text: "Men's Clothes",
      ),
      Tab(
        text: "Women's Clothes",
      ),
    ],
  );
}
