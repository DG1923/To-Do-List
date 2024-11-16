import 'package:flutter/material.dart';
import 'package:to_do_list/constants.dart';

class SignUpScreen extends StatelessWidget {
  static const String SignupId = "SignUpId";
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
    Column(
      children: [
        // Hình ảnh bo tròn ở trên
        CircleAvatar(
          radius: 60,
          backgroundImage: AssetImage('assets/images/signup_image.png'),
        ),
        SizedBox(height: 20),
        // Đăng ký với Google
        ElevatedButton.icon(
          onPressed: () {
            // Xử lý đăng ký với Google
          },
          icon: Icon(Icons.login),
          label: Text("Đăng ký với Google"),
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryColor, // Màu sắc của Google
          ),
        ),
        SizedBox(height: 10),
        // Đăng ký với Apple
        ElevatedButton.icon(
          onPressed: () {
            // Xử lý đăng ký với Apple
          },
          icon: Icon(Icons.login),
          label: Text("Đăng ký với Apple"),
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryColor, // Màu sắc của Google
          ),
        ),
        SizedBox(height: 10),
        // Đăng ký với Email
        ElevatedButton.icon(
          onPressed: () {
            // Xử lý đăng ký với Email
          },
          icon: Icon(Icons.email),
          label: Text("Đăng ký với Email"),
        ),
        SizedBox(height: 20),
      ],
    // ); Scaffold(
    //   appBar: AppBar(title: Text("Sign Up")),
    //   body: Padding(
    //     padding: EdgeInsets.all(16.0),
    //     child: Column(
    //       children: [
    //         TextField(
    //           controller: _emailController,
    //           decoration: InputDecoration(labelText: "Email"),
    //         ),
    //         TextField(
    //           controller: _passwordController,
    //           decoration: InputDecoration(labelText: "Password"),
    //           obscureText: true,
    //         ),
    //         SizedBox(height: 20),
    );
    //         true? CircularProgressIndicator()
    //             : ElevatedButton(
    //           onPressed: () {
    //             final email = _emailController.text;
    //             final password = _passwordController.text;
    //           },
    //           child: Text("Sign Up"),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
