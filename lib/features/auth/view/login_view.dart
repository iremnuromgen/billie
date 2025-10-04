import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.pink,
        body: Center(
          child: Text(
            'Login Sayfası',
            style: TextStyle(
              color: Colors.amber,
              fontSize: 20
            ),
          ),
        ),
      ),
    );
  }
}