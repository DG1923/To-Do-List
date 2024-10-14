import 'package:flutter/material.dart';
import 'package:to_do_list/widget/listTile.dart';
import 'package:to_do_list/models/taskData.dart';
import 'package:provider/provider.dart';
class Todo extends StatelessWidget {

  Todo({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<Taskdata>(
      builder: (context,tasks,child){
        return ListView.builder(
          itemCount: tasks.getCount,
          itemBuilder: (BuildContext context, int index) {
            return Listtile(index:index);
          },
        );
      },
    );

  }

}

