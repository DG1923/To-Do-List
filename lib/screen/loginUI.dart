import 'package:flutter/material.dart';
import 'package:to_do_list/constants.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.asset(
            'assets/image/login3.jpg',
            height: 300,
            width: 300,
          ),
        ),
        Text(
          "Welcome Back",
          style: kTextLarge,
        ),

      ]),
    );
  }
}
