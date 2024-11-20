import 'package:flutter/material.dart';
import 'package:to_do_list/views/screen/signUpScreen/signupScreen.dart';
import 'package:to_do_list/views/screen/toDoScreen/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/viewmodels/taskData.dart';
import 'package:to_do_list/views/screen/loginScreen/loginUI.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
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


