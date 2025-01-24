import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/auth/cubit/auth_cubit.dart';
import 'package:store_app/core/auth/cubit/auth_state.dart';
import 'package:store_app/core/auth/auth_widgets/form_appbar.dart';
import 'package:store_app/core/screens.dart';
import 'package:store_app/features/auth_login/view/widgets/login_form_builder.dart';

final TextEditingController emailControllerLogin = TextEditingController();
final TextEditingController passwordControllerLogin = TextEditingController();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (BuildContext context, state) {
        if (state is LoginSuccessState) {
          if (state.loginUserData["status"] == "success") {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                content: Text(state.loginUserData["message"]),
              ),
            );
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return MainScreen();
                },
              ),
            );
          } else if (state.loginUserData["status"] == "error") {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(state.loginUserData["message"]),
              ),
            );
          }
        } else {
          const Center(child: CircularProgressIndicator());
        }
      },
      builder: (context, state) {
        AuthCubit cubit = BlocProvider.of(context);
        return Scaffold(
          appBar: formAppBar(title: 'Welcome Back'),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: LoginFormBuilder(cubit: cubit),
          ),
        );
      },
    );
  }
}
