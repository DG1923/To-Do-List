import 'package:flutter/material.dart';
import 'package:to_do_list/views/screen/toDoScreen/tasks_screen.dart';
import 'package:to_do_list/views/widgets/constants.dart';
import 'package:to_do_list/views/widgets/custom_button.dart';
import 'package:to_do_list/viewmodels/authViewModel.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/viewmodels/authViewModel/email_auth_view_model.dart';
class Prompt extends StatefulWidget {
  Prompt({super.key});
  final TextEditingController _email = new TextEditingController();
  final TextEditingController _password = new TextEditingController();

  @override
  State<Prompt> createState() => _PromptState();
}

class _PromptState extends State<Prompt> {
  bool hidePassword = true;
  final bool rememberAccount = false;
  Card card({required String hintText,bool isPasswords = false, required textEditingController}){
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
          controller: textEditingController,
          obscureText: isPasswords,
          decoration: isPasswords ?kTextFieldDecoration.copyWith(hintText: "Enter your password") : kTextFieldDecoration.copyWith(hintText: "Enter your email"),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      card(hintText:"Enter your email", textEditingController: widget._email),
      card(hintText: "Enter your password",isPasswords: true, textEditingController: widget._password),
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
      Consumer<EmailAuthViewModel>(
        builder: (context,authViewmodel, child){
          return authViewmodel.isLoading?CircularProgressIndicator():kCustomButton(function: ()async{
            if(await authViewmodel.signInWithEmail(widget._email.text, widget._password.text) == true){
            if(context.mounted){
              Navigator.pushNamed(context, TasksScreen.TaskScreenId);
            }
              }
          }, text: "Login");
        }
      )
    ]);
  }
}
