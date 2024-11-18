import 'package:flutter/material.dart';
import 'package:to_do_list/viewmodels/taskData.dart';
import 'package:provider/provider.dart';
class Listtile extends StatelessWidget {
  const Listtile({super.key,required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        Provider.of<Taskdata>(context).taskTodo[index].nameTask,
        style: TextStyle(
          decoration: Provider.of<Taskdata>(context).taskTodo[index].isDone?TextDecoration.lineThrough:null,
        ),
      ),
      onTap: (){
        Provider.of<Taskdata>(context,listen: false).isDone(index);
      },
      trailing: Checkbox(
        value: Provider.of<Taskdata>(context).taskTodo[index].isDone,
        activeColor: Colors.lightBlueAccent,
        onChanged: (value){
          Provider.of<Taskdata>(context,listen: false).isDone(index);
        },
      ),
    );
  }
}
