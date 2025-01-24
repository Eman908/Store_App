import 'package:flutter/material.dart';

AppBar formAppBar({required String title}) {
  return AppBar(
    toolbarHeight: 80,
    // elevation: 4,
    // shadowColor: Colors.grey,
    title: Text(
      title,
      style: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),
    ),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    automaticallyImplyLeading: false,
    iconTheme: const IconThemeData(color: Colors.white),
  );
}
