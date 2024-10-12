import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'todo_screen.dart';
import 'addTaskScreen.dart';
import 'package:to_do_list/models/task.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/models/taskData.dart';

List<Task> taskTodo = [
  Task(nameTask: "Hoc lap trinh"),
  Task(nameTask: "Viet app mobile"),
  Task(nameTask: "Cleaning the house"),
  Task(nameTask: "buy a cup of coffee"),
  Task(nameTask: "Lap trinh extension  fsdf"),
];

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});
  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  void addTaskList(String nameTask) {
    setState(() {
      Task temp = Task(nameTask: nameTask);
      taskTodo.add(temp);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet<void>(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return Addtaskscreen(
                    voidCallBack: addTaskList,
                  );
                });
          },
          backgroundColor: Colors.lightBlueAccent,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.lightBlueAccent,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                    EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      child: Icon(
                        Icons.list,
                        size: 30,
                      ),
                      backgroundColor: Colors.white,
                      radius: 30,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Giap To Do",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    Text(
                      '${Provider.of<Taskdata>(context).getCount} tasks',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                    color: Colors.white,
                  ),
                  child: Todo(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
