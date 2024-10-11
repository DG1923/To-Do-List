import 'package:flutter/material.dart';
import 'package:to_do_list/models/task.dart';
class Listtile extends StatelessWidget {
  const Listtile({super.key,required this.task,required this.voidCallBackFunction});
  final Task task;
  final Function voidCallBackFunction;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.nameTask,
        style: TextStyle(
          decoration: task.isDone!?TextDecoration.lineThrough:null,
        ),
      ),
      onTap: (){
        voidCallBackFunction();
      },
      trailing: Checkbox(
        value: task.isDone,
        activeColor: Colors.lightBlueAccent,
        onChanged: (value){
          voidCallBackFunction();
        },
      ),
    );;
  }
}
