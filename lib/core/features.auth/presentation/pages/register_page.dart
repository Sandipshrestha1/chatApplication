import 'package:chat_app/core/features.auth/presentation/bloc/auth_event.dart';
import 'package:chat_app/core/features.auth/presentation/widgets/auth_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_state.dart';
import '../widgets/auth_button.dart';
import '../widgets/login_prompt.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // ignore: unused_element
  void _showInputValues() {
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    // ignore: avoid_print
    print("Username: $username - Email : $email -Password: $password");
  }

  void _onRegister() {
    BlocProvider.of<AuthBloc>(context).add(
      RegisterEvent(
        username: _usernameController.text,
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
              AuthInputField(
                  hint: "Username",
                  icon: Icons.person,
                  controller: _usernameController),
              SizedBox(height: 20),
              AuthInputField(
                  hint: "Email",
                  icon: Icons.email,
                  controller: _emailController),
              SizedBox(height: 20),
              AuthInputField(
                  hint: "Password",
                  icon: Icons.lock,
                  controller: _passwordController),
              BlocConsumer<AuthBloc, AuthState>(builder: (context, state) {
                if (state is AuthLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                return AuthButton(text: "Register", onPressed: _onRegister);
              }, listener: (context, state) {
                if (state is AuthSuccess) {
                  Navigator.pushNamed(context, '/login');
                } else if (state is AuthFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.error),
                    ),
                  );
                }
              }),
              SizedBox(height: 20),
              LoginPrompt(
                title: "Already have an account",
                subtitle: "Click here to login",
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
