import 'package:flutter/material.dart';
import 'package:to_do_list/services/firebase/firebase_options.dart';
import 'package:to_do_list/viewmodels/authViewModel.dart';
import 'package:to_do_list/views/screen/signUpScreen/signupScreen.dart';
import 'package:to_do_list/views/screen/toDoScreen/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/viewmodels/taskData.dart';
import 'package:to_do_list/views/screen/loginScreen/loginUI.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Authviewmodel()),
        ChangeNotifierProvider(create: (context) => Taskdata()),
      ],

      child: MaterialApp(
        initialRoute: LoginScreen.LoginScreenId,
        routes: {
          SignUpScreen.SignupId: (context)=>SignUpScreen(),
          LoginScreen.LoginScreenId: (context)=>LoginScreen(),
          TasksScreen.TaskScreenId: (context)=>TasksScreen(),
        },
        home: StreamBuilder<User?>(
          stream:FirebaseAuth.instance.authStateChanges(),
          builder:(context, snapshot) {
            if(snapshot.hasData){
              return TasksScreen();
            }else if(snapshot.hasError){
              return Center(child: Text("Something went wrong"));
            }else if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }else if(snapshot.error != null){
              return Center(child: Text("Something went wrong"));
            }else{
              return LoginScreen();
            }
          },
        ),
      ),
    );
  }
}


