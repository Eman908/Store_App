import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/auth/cubit/auth_cubit.dart';
import 'package:store_app/core/auth/cubit/auth_state.dart';
import 'package:store_app/core/auth/auth_widgets/form_appbar.dart';
import 'package:store_app/features/auth_login/view/screen/login_screen.dart';
import 'package:store_app/features/auth_signup/view/widgets/signup_form_builder.dart';

final TextEditingController nameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController phoneController = TextEditingController();
final TextEditingController idController = TextEditingController();
final TextEditingController tokenController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController genderController = TextEditingController();
final TextEditingController imageController = TextEditingController();

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: formAppBar(title: "Create Account"),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccessState) {
            if (state.authData["status"] == "success") {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green,
                  content: Text(state.authData["message"]),
                ),
              );
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const LoginScreen();
              }));
            }
            if (state.authData["status"] == "error") {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(state.authData["message"]),
                ),
              );
            }
          } else {
            const Center(child: CircularProgressIndicator());
          }
        },
        builder: (context, state) {
          AuthCubit cubit = BlocProvider.of(context);

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SignupFormBuilder(
                cubit: cubit,
              ),
            ),
          );
        },
      ),
    );
  }
}
