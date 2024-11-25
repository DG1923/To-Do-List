import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_list/views/screen/loginScreen/components/header.dart';
import 'package:to_do_list/views/screen/loginScreen/components/loginWithSocial.dart';
import 'package:to_do_list/views/screen/loginScreen/components/prompt.dart';
import 'package:to_do_list/views/screen/signUpScreen/signupScreen.dart';
import 'package:to_do_list/views/widgets/constants.dart';
import 'package:to_do_list/views/widgets/custom_image.dart';

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
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
                children: [
                  const Header(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                    child:Prompt(),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SignUpScreen.SignupId);
                    },
                    child: Text(
                      "Don't have an account? Sign Up Now",
                      style: kTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                  //Line with text Login with
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
                  LoginWithSocial(),      
                  const SizedBox(
                    height: 20,
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
