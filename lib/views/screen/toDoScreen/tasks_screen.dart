import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/views/screen/loginScreen/loginUI.dart';
import 'package:to_do_list/views/screen/toDoScreen/components/headerSceen.dart';
import 'package:to_do_list/views/screen/toDoScreen/components/addTaskScreen.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/viewmodels/taskData.dart';
import 'package:to_do_list/viewmodels/authViewModel.dart';
class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});
  static const String TaskScreenId = "TaskScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<void>(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return Addtaskscreen(
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
                  const CircleAvatar(
                    child:Icon(
                      Icons.list,
                      size: 30,
                    ),
                    backgroundColor: Colors.white,
                    radius: 30,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Consumer<Authviewmodel>(
                    builder: (context, authViewModel, child) {
                      return Text(
                        "Hello, ${authViewModel.user?.displayName ?? "Giap To Do"}",
                        style:const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      );
                    },
                    ),
                  Consumer<Taskdata>(
                    builder: (context, taskData, child) {
                      return Text(
                        '${taskData.getCount} tasks',
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                  Consumer<Authviewmodel>(
                    builder: (context, authViewModel, child) {
                      return IconButton(
                        onPressed: () async {
                          await authViewModel.signOut();
                          if (context.mounted) {
                            Navigator.pushReplacementNamed(
                              context, 
                              LoginScreen.LoginScreenId
                            );
                          }
                        },
                        icon: const Icon(
                          Icons.logout,
                          color: Colors.white,
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(30),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                  color: Colors.white,
                ),
                child: HeaderScreen(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
