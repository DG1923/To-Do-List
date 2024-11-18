import 'package:flutter/material.dart';
import 'package:to_do_list/views/screen/loginScreen/loginUI.dart';
import 'package:to_do_list/views/widgets/constants.dart';

class SignUpScreen extends StatelessWidget {
  static const String SignupId = "SignUpId";
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
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
          Expanded(child:Padding(padding: EdgeInsets.symmetric(horizontal: 50,vertical: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Center(
                child: Text(
                    "Sign up",
                    style: kTextStyle.copyWith(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ),
                Text("Email",style: kTextStyle.copyWith(fontSize: 18),),
                Card(
                  color: Colors.white,
                  child: ListTile(
                    title: TextField(
                      decoration:
                      kTextFieldDecoration.copyWith(hintText: "Enter your email"),
                    ),
                  ),
                ),
                Text("Password",style: kTextStyle.copyWith(fontSize: 18),),
                Card(
                  color: Colors.white,
                  child: ListTile(
                    trailing: GestureDetector(
                      onTap: () {

                      },
                      child: Icon(
                        Icons.lock,
                        color: kPrimaryColor,
                        size: 20,
                      ),
                    ),
                    title: TextField(
                      obscureText: true,
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: "Enter your password"),
                    ),
                  ),
                ),
                 Text("Confirm Password",style: kTextStyle.copyWith(fontSize: 18),),
                Card(
                  color: Colors.white,
                  child: ListTile(
                    title: TextField(
                      obscureText: true,
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: "Enter confirm password"),
                    ),
                  ),
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
                      child: Text("Sign up",
                        style: kTextStyle.copyWith(
                          fontSize: 20,
                          color: Colors.white,
                        ),),
                    )
                ),
                SizedBox(height: 15,),
                Center(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, LoginScreen.LoginScreenId);
                    },
                    child: Text(
                      "Already have an account?",
                      style: kTextStyle.copyWith(
                        fontSize: 16,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w900,
                      ),
                      ),
                  ),
                )
            ],),))
          ],
        )
      ),
    );
  }
}
