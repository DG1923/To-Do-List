import 'package:flutter/material.dart';
import 'package:to_do_list/views/widgets/constants.dart';

class Prompt extends StatefulWidget {
  Prompt({super.key});
  @override
  State<Prompt> createState() => _PromptState();
}

class _PromptState extends State<Prompt> {
  bool hidePassword = true;
  final bool rememberAccount = false;
  Card card({required String hintText,bool isPasswords = false}){
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side:const BorderSide(
            width: 10,
            color: Colors.white38,
          )),
      color: Colors.white,
      child: ListTile(
        trailing: isPasswords ?  GestureDetector(
            onTap: () {
              setState(() {
                hidePassword = !hidePassword;
              });
            },
            child: Icon(
              hidePassword
                  ? Icons.remove_red_eye_outlined
                  : Icons.hide_source_outlined,
            )
          ):null,
        leading: isPasswords ? const Icon(
            Icons.password,
            color: kPrimaryColor,
          ) :const Icon(
          Icons.account_circle,
          color: kPrimaryColor,
        ),
        title: TextField(
          obscureText: isPasswords ? (hidePassword ? true : false) :false,          
          decoration: isPasswords ?kTextFieldDecoration.copyWith(hintText: "Enter your password") : kTextFieldDecoration.copyWith(hintText: "Enter your email"),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      card(hintText:"Enter your email"),
      card(hintText: "Enter your password",isPasswords: true), 
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
    ]);
  }
}
