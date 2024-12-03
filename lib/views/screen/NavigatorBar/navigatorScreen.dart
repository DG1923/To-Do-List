import 'package:flutter/material.dart';
import 'package:to_do_list/views/screen/HomeScreen/homeScreen.dart';
import 'package:to_do_list/views/screen/HabitsScreen/habitsScreen.dart';
import 'package:to_do_list/views/screen/PomodoroScreen/pomodoroScreen.dart';
import 'package:to_do_list/views/screen/toDoScreen/tasks_screen.dart';
import 'package:to_do_list/views/screen/toDoScreen/modern_tasks_screen.dart';

class Navigatorscreen extends StatefulWidget {
  const Navigatorscreen({super.key});
  static const String NavigatorScreenId = "NavigatorScreenId";

  @override
  State<Navigatorscreen> createState() => _NavigatorscreenState();
}

class _NavigatorscreenState extends State<Navigatorscreen> {
  int _index = 0;
  List<Widget> _widgetOptions = <Widget>[
    TasksScreen(),
    ModernTasksScreen(),
    Pomodoroscreen(),
  ];
  void _onTapChanged(int index){
    setState(() {
      _index = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_index],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "Habits",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: "Pomodoro",
          ),
        ],
        currentIndex: _index,
        onTap: _onTapChanged,
        selectedItemColor: Colors.lightBlueAccent,
      ),
    );;
  }
}
