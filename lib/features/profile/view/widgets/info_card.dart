import 'package:flutter/material.dart';

Card infoCard({required IconData icon, required String data}) {
  return Card(
    elevation: 0,
    color: Colors.grey.shade100,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        spacing: 16,
        children: [
          Icon(icon, color: Colors.blueGrey),
          Text(
            data,
            style: const TextStyle(fontSize: 16),
          )
        ],
      ),
    ),
  );
}
