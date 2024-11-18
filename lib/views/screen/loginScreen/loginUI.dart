import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_list/views/screen/signUpScreen/signupScreen.dart';
import 'package:to_do_list/views/widgets/constants.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});
  static const String LoginScreenId = "LoginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  'assets/image/photo.png',
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover,
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
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: const BorderSide(
                            width: 10,
                            color: Colors.white38,
                          )),
                      color: Colors.white,
                      child: ListTile(
                        leading: const Icon(
                          Icons.account_circle,
                          color: kPrimaryColor,
                        ),
                        title: TextField(
                          decoration: kTextFieldDecoration.copyWith(
                              hintText: "Enter your email"),
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
                          onTap: () {},
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
                    onTap: () {},
                    child: Row(
                      children: [
                        Checkbox(value: rememberAccount, onChanged: (value) {}),
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
                        side: const BorderSide(
                          width: 0,
                          color: kPrimaryColor,
                        )),
                    onPressed: () {},
                    child: Text(
                      "Login",
                      style: kTextStyle.copyWith(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  )),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, SignUpScreen.SignupId);
                },
                child: Text(
                  "Don't have an account? Sign Up Now",
                  style: kTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
                ),
              ),
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      color: kPrimaryColor,
                      thickness: 1,
                    ),
                  ),
                  Text(
                    "Or Login with",
                    style: kTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      color: kPrimaryColor,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MaterialButton(
                      height: 60,
                      minWidth: 60,
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.black.withOpacity(0.5), width: 1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Image.asset(
                        'assets/image/icon/google.png',
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      height: 60,
                      minWidth: 60,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.black.withOpacity(0.5), width: 1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Image.asset(
                        'assets/image/icon/apple.png',
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ]),
                  const SizedBox(
                    height: 20,
                  ),
                
            ]),
      ),
    );
  }
}
