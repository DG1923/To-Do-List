import 'package:flutter/material.dart';
import 'package:to_do_list/models/task.dart';
import 'package:to_do_list/screen/signupScreen.dart';
import 'screen/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/providers/taskData.dart';
import 'screen/loginUI.dart';
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
        initialRoute: LoginScreen.LoginScreenId,
        routes: {
          SignUpScreen.SignupId: (context)=>SignUpScreen(),
          LoginScreen.LoginScreenId: (context)=>LoginScreen(),
          TasksScreen.TaskScreenId: (context)=>TasksScreen(),
        },
      ),
    );
  }
}
