

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_sample/LoginCubit/forgot_password_state.dart';

import 'forgot_password_cubit.dart';
import 'login_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Column(
        children: [
          MultiBlocListener(
            listeners: [
              BlocListener<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.error)),
                    );
                  } else if (state is LoginSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Login Successful!')),
                    );
                    // Navigate to the next screen if needed
                  }
                },
              ),
              BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
                listener: (context, state) {
                  if (state is ForgotPasswordFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.error)),
                    );
                  } else if (state is ForgotPasswordSuccess) {
                    _emailAddressController.text="";// Assuming you have a ForgotPasswordSuccess state
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Mail sent successfully!')),
                    );
                  }
                },
              ),
            ],
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(labelText: 'Username'),
                  ),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      return state is LoginLoading
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                        onPressed: () {
                          final username = _usernameController.text.trim();
                          final password = _passwordController.text.trim();

                          if (username.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Username cannot be empty')),
                            );
                            return;
                          }

                          if (password.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Password cannot be empty')),
                            );
                            return;
                          }

                          context.read<LoginCubit>().login(username, password);
                        },
                        child: const Text('Login'),
                      );
                    },
                  ),
                  const SizedBox(height: 50),
                  TextField(
                    controller: _emailAddressController,
                    decoration: const InputDecoration(labelText: 'Enter email address'),
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
                    builder: (context, state) {
                      return state is ForgotPasswordLoading
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                        onPressed: () {
                          final emailAddress = _emailAddressController.text.trim();

                          if (emailAddress.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Email address cannot be empty')),
                            );
                            return;
                          }

                          context.read<ForgotPasswordCubit>().forgotPassword(emailAddress);
                        },
                        child: const Text('Forgot Password'),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}