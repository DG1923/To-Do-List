import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_list/constants.dart';
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  static const String LoginScreenId = "LoginScreen";
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  late bool hidePassword = true;
  late bool rememberAccount = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(children: [
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
          Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 0),
            child: Column(
              children: [
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
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side:const BorderSide(
                        width: 10,
                        color: Colors.white38,
                      )),
                  color: Colors.white,
                  child: ListTile(
                    leading:const Icon(
                      Icons.account_circle,
                      color: kPrimaryColor,
                    ),
                    title: TextField(
                      decoration:
                      kTextFieldDecoration.copyWith(hintText: "Enter your email"),
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      side: BorderSide(
                        color: Colors.white38,
                        width: 2,
                      )),
                  child: ListTile(
                    trailing: GestureDetector(
                      onTap: () {

                      },
                      child: Icon(
                        hidePassword
                            ? Icons.remove_red_eye_outlined
                            : Icons.hide_source_outlined,
                      ),
                    ),
                    leading: Icon(
                      Icons.password,
                      color: kPrimaryColor,
                    ),
                    title: TextField(
                      obscureText: hidePassword ? true : false,
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: "Enter your password"),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {

                      },
                      child: Row(
                        children: [
                          Checkbox(
                              value: rememberAccount,
                              onChanged: (value) {

                              }),
                          Text("Remember Account"),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password?",
                        style: kTextStyle.copyWith(
                          fontSize: 14,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                    width: double.infinity,
                    child: MaterialButton(
                      minWidth: 200,
                      color: kPrimaryColor,
                      splashColor: kPrimaryColor.withOpacity(0.8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(
                            width: 0,
                            color: kPrimaryColor,
                          )
                      ),
                      onPressed: () {  },
                      child: Text("Login",
                        style: kTextStyle.copyWith(
                          fontSize: 20,
                          color: Colors.white,
                        ),),
                    )
                )
              ],
            ),
          ))
        ]),
      ),
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
