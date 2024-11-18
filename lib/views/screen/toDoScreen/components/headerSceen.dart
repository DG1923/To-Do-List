import 'package:flutter/material.dart';
import 'package:to_do_list/views/screen/toDoScreen/components/listTile.dart';
import 'package:to_do_list/viewmodels/taskData.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HeaderScreen extends StatelessWidget {
  HeaderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<Taskdata>(
      builder: (context, tasks, child) {
        return ListView.builder(
          itemCount: tasks.getCount,
          itemBuilder: (BuildContext context, int index) {
            return Slidable(
              endActionPane: ActionPane(
                motion: const DrawerMotion(),
                children:  [
                  SlidableAction(
                    flex: 2,
                    onPressed: (BuildContext context) {
                      Provider.of<Taskdata>(context,listen: false).deleteData(index);
                    },
                    backgroundColor: Colors.redAccent,
                    icon: Icons.delete,
                  )
                ],
              ),
              child: Listtile(index: index),
            );
          },
        );
      },
    );
  }
}
