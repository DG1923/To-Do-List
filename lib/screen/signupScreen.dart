import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  static const String SignupId = "SignUpId";
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            SizedBox(height: 20),

            true? CircularProgressIndicator()
                : ElevatedButton(
              onPressed: () {
                final email = _emailController.text;
                final password = _passwordController.text;
              },
              child: Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
