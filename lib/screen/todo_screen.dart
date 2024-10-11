import 'package:flutter/material.dart';
import 'package:to_do_list/models/task.dart';
import 'package:to_do_list/widget/listTile.dart';

class Todo extends StatefulWidget {
  List<Task> taskTodo;

  Todo({super.key, required this.taskTodo});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
          color: Colors.white,
        ),
        child: Container(
            padding: EdgeInsets.all(30),
            child: ListView.builder(
              itemCount: widget.taskTodo.length,
              itemBuilder: (BuildContext context, int index) {
                String task = widget.taskTodo[index].nameTask;
                bool value = widget.taskTodo[index].isDone;
                return Listtile(task: widget.taskTodo[index], voidCallBackFunction: (){
                  setState(() {
                    widget.taskTodo[index].getDoneTask();
                  });
                });
              },
            )),
      ),
    );
    
  }
}
