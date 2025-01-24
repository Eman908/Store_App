import 'package:flutter/material.dart';
import 'package:store_app/core/auth/cubit/auth_cubit.dart';
import 'package:store_app/core/auth/auth_data/data/model/text_field_list.dart';
import 'package:store_app/features/auth_login/view/screen/login_screen.dart';
import 'package:store_app/features/auth_signup/view/screen/signup_screen.dart';
import 'package:store_app/core/auth/auth_widgets/custom_input_field.dart';
import 'package:store_app/core/auth/auth_widgets/password_input_field.dart';
import 'package:store_app/core/auth/auth_widgets/submit_button.dart';

class LoginFormBuilder extends StatelessWidget {
  const LoginFormBuilder({
    super.key,
    required this.cubit,
  });

  final AuthCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomInputField(f: loginList[0]),
          const SizedBox(
            height: 24,
          ),
          PasswordInputField(controller: passwordControllerLogin),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
              width: double.infinity,
              child: submitButton(
                  cubit: cubit,
                  onPressed: () {
                    cubit.getLoginDataCubit(
                      email: emailControllerLogin.text,
                      password: passwordControllerLogin.text,
                    );
                  })),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have account?",
                style: TextStyle(fontSize: 16),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const SignupScreen();
                      },
                    ),
                  );
                },
                child: const Text(
                  "SignUp",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
