import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/core/validator/validator.dart';
import 'package:store_app/core/auth/auth_data/data/model/text_field_model.dart';
import 'package:store_app/features/auth_login/view/screen/login_screen.dart';
import 'package:store_app/features/auth_signup/view/screen/signup_screen.dart';

List<TextFieldModel> signupList = [
  TextFieldModel(
    controller: nameController,
    prefixIcon: Icons.person,
    labelText: 'Name',
    hintText: 'Enter Name',
    validator: (value) {
      return MyValidators.displayNameValidator(value);
    },
  ),
  TextFieldModel(
    controller: emailController,
    prefixIcon: Icons.email,
    labelText: 'Email',
    hintText: 'Enter Email',
    validator: (value) {
      return MyValidators.emailValidator(value);
    },
  ),
  TextFieldModel(
    type: TextInputType.number,
    controller: phoneController,
    prefixIcon: Icons.phone,
    labelText: 'Phone',
    hintText: 'Enter Phone',
    validator: (value) {
      return MyValidators.phoneValidator(value);
    },
  ),
  TextFieldModel(
    type: TextInputType.number,
    controller: idController,
    prefixIcon: Icons.picture_in_picture_outlined,
    labelText: 'National ID',
    hintText: 'Enter National ID',
    validator: (value) {
      return MyValidators.nationalIdValidator(value);
    },
  ),
  TextFieldModel(
    controller: tokenController,
    prefixIcon: Icons.token,
    labelText: 'Token',
    hintText: 'Enter Token',
    validator: (value) {
      return MyValidators.tokenValidator(value);
    },
  ),
];

List<TextFieldModel> loginList = [
  TextFieldModel(
    controller: emailControllerLogin,
    prefixIcon: Icons.email,
    labelText: 'Email',
    hintText: 'Enter Email',
    validator: (value) {
      return MyValidators.emailValidator(value);
    },
  ),
];

class CashToken {
  static SharedPreferences? shared;
  static init() async {
    shared = await SharedPreferences.getInstance();
  }
}
