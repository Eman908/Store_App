import 'package:flutter/material.dart';
import 'package:store_app/core/auth/cubit/auth_cubit.dart';
import 'package:store_app/core/auth/auth_widgets/submit_style.dart';

MaterialButton submitButton(
    {required AuthCubit cubit, required void Function()? onPressed}) {
  return MaterialButton(
    height: 48,
    elevation: 4,
    onPressed: onPressed,
    color: Colors.blue,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text("Submit", style: buttonStyle()),
  );
}
