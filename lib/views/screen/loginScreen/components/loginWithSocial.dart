import 'package:flutter/material.dart';
import 'package:to_do_list/views/screen/toDoScreen/tasks_screen.dart';
import 'package:to_do_list/views/widgets/constants.dart';
import 'package:to_do_list/viewmodels/authViewModel.dart';
import 'package:provider/provider.dart';

class LoginWithSocial extends StatelessWidget {
  LoginWithSocial({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<Authviewmodel>(
            builder: (context, authViewModel, child) {
              return authViewModel.isLoading ? CircularProgressIndicator() : MaterialButton(
              height: 60,
              minWidth: 60,
              onPressed: () async {
                if(await authViewModel.signInWithGoogle() == true){
                  Navigator.pushNamed(context, TasksScreen.TaskScreenId);
                }
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Image.asset(
                'assets/icon/google.png',
                height: 40,
                fit: BoxFit.cover,
              ),
            );
          },
          ),
          MaterialButton(
            onPressed: () {},
            height: 60,
            minWidth: 60,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Image.asset(
              'assets/icon/apple.png',
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
        ]);
  }
}
