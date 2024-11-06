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
      backgroundColor: kPrimaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
        SizedBox(
          height: 350,
          width: double.infinity,
          child: ClipPath(
            clipper: CustomClip(),
            child: Image.asset(
              'assets/image/login3.jpg',
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Text(
          "Welcome Back",
          style: kTextStyle.copyWith(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Login to your account",
          style: kTextStyle.copyWith(
            fontSize: 18,
          ),

        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
          child: Card(
            color: Colors.white,
            child: ListTile(
              leading: Icon(
                Icons.account_circle,
                color: kPrimaryColor,
              ),
              title: TextField(
                decoration: kTextFieldDecoration,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
          child: Card(
            color: Colors.white,
            child: ListTile(
              leading: Icon(
                Icons.password,
                color: kPrimaryColor,
              ),
              title: TextField(
                obscureText: true,
                decoration: kTextFieldDecoration,
              ),
            ),
          ),
        ),
        Checkbox(value: false, onChanged: (value) {})
      ]),
    );
  }
}

class CustomClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    double h = size.height;
    double w = size.width;
    Path path = Path();
    // path.lineTo(0, h);
    // path.lineTo(w,h);
    // path.lineTo(w,0);
    // path.close();
    // path.quadraticBezierTo(x1, y1, x2, y2)
    path.lineTo(0, h - 100); // Bắt đầu từ góc dưới bên trái
    path.quadraticBezierTo(w / 2, h + 50, w,
        h - 100); //Đường cong với x1y1 = (w/2,h+50) với x2y2 = w,h-100
    path.lineTo(w, 0); // Nối đến góc trên bên phải
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
