import 'package:flutter/material.dart';
import 'screen/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/models/taskData.dart';
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
        home:TasksScreen (),
      ),
    );
  }
}
