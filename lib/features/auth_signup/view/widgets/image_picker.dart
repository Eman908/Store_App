import 'package:flutter/material.dart';
import 'package:store_app/core/auth/cubit/auth_cubit.dart';

Row imagePicker({required AuthCubit cubit}) {
  return Row(
    spacing: 16,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      cubit.imageFile == null
          ? InkWell(
              onTap: () {
                cubit.addImage();
              },
              child: const Card(
                child: Icon(
                  Icons.camera,
                  size: 100,
                  color: Colors.blueGrey,
                ),
              ),
            )
          : Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: FileImage(cubit.imageFile!),
                  fit: BoxFit.fill,
                ),
              ),
            )
    ],
  );
}
