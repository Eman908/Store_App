import 'package:flutter/material.dart';
import 'package:store_app/core/auth/cubit/auth_cubit.dart';
import 'package:store_app/core/auth/auth_data/data/model/text_field_list.dart';
import 'package:store_app/features/auth_login/view/screen/login_screen.dart';
import 'package:store_app/features/auth_signup/view/screen/signup_screen.dart';
import 'package:store_app/core/auth/auth_widgets/custom_input_field.dart';
import 'package:store_app/features/auth_signup/view/widgets/gender_selector.dart';
import 'package:store_app/features/auth_signup/view/widgets/image_picker.dart';
import 'package:store_app/core/auth/auth_widgets/password_input_field.dart';
import 'package:store_app/core/auth/auth_widgets/submit_button.dart';

class SignupFormBuilder extends StatelessWidget {
  const SignupFormBuilder({super.key, required this.cubit});
  final AuthCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        spacing: 16,
        children: [
          imagePicker(cubit: cubit),
          const Divider(
            thickness: 1,
          ),
          CustomInputField(
            f: signupList[0],
          ),
          CustomInputField(
            f: signupList[1],
          ),
          CustomInputField(
            f: signupList[2],
          ),
          CustomInputField(
            f: signupList[3],
          ),
          GenderSelector(genderController: genderController),
          PasswordInputField(
            controller: passwordController,
          ),
          CustomInputField(
            f: signupList[4],
          ),
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: submitButton(
                  cubit: cubit,
                  onPressed: () {
                    cubit.getSignUpDataCubit(
                      name: nameController.text,
                      email: emailController.text,
                      phone: phoneController.text,
                      nationalId: idController.text,
                      gender: genderController.text,
                      password: passwordController.text,
                      token: tokenController.text,
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have account?",
                    style: TextStyle(fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const LoginScreen();
                          },
                        ),
                      );
                    },
                    child: const Text(
                      "LogIn",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
