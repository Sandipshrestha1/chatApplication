import 'package:chat_app/core/features.auth/presentation/bloc/auth_bloc.dart';
import 'package:chat_app/core/features.auth/presentation/bloc/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_input_field.dart';
import '../widgets/login_prompt.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLogin() {
    BlocProvider.of<AuthBloc>(context).add(LoginEvent(
        email: _emailController.text, password: _passwordController.text));
  }

  // ignore: unused_element
  void _showInputValues() {
    String email = _emailController.text;
    String password = _passwordController.text;
    // ignore: avoid_print
    print("Email: $email, password: $password");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
//              _buildTextInput("Email", Icons.email, _emailController),
              AuthInputField(
                  hint: "Email",
                  icon: Icons.email,
                  controller: _emailController),
              SizedBox(height: 20),
              // _buildTextInput(
              //   "Password",
              //   Icons.password_rounded,
              //   _passwordController,
              //   isPassword: true,
              // ),

              AuthInputField(
                  hint: "Password",
                  icon: Icons.lock,
                  controller: _passwordController),

              SizedBox(height: 20),

              AuthButton(
                text: "Login",
                onPressed: _onLogin,
              ),
              SizedBox(height: 20),

              LoginPrompt(
                title: " Don't have an account",
                subtitle: "click here to signUp",
                onTap: () {},
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
