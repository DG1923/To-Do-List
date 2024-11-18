import 'package:flutter/material.dart';
import 'package:to_do_list/views/screen/signUpScreen/signupScreen.dart';
import 'package:to_do_list/views/screen/toDoScreen/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/viewmodels/taskData.dart';
import 'package:to_do_list/views/screen/loginScreen/loginUI.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return Taskdata();
      },
      child: MaterialApp(
        initialRoute: TasksScreen.TaskScreenId,
        routes: {
          SignUpScreen.SignupId: (context)=>SignUpScreen(),
          LoginScreen.LoginScreenId: (context)=>LoginScreen(),
          TasksScreen.TaskScreenId: (context)=>TasksScreen(),
        },
      ),
    );
  }
}

