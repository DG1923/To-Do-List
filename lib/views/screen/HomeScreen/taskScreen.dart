import 'package:flutter/material.dart';
import 'package:to_do_list/views/widgets/constants.dart';

class Taskscreen extends StatelessWidget {
  Taskscreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> titleTask = [
      "task 1",
      "task 2",
      "task 3",
      "task 4",
      "task 5",
      "task 6",
    ];
    List<String> sectionTask = [
      "Personal",
      "Company",
      "Family",
      "Start-up",
    ];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){},
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 30),
              children: [
                _categoriesTab("Personal", false),
                _categoriesTab("Personal", true),
                _categoriesTab("Personal", true),
                _categoriesTab("Personal", false),
              ],
            ),
          ),
          Expanded(child: ListView(
            children: sectionTask.map((String sectionTask){
              return _sectionCard(sectionTask,titleTask);
            }).toList(),
          ))

        ],
      ),
    );
  }
  Widget _sectionCard(String sectionTask,List<String> titleTasks){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        color: Colors.white,
        child: ExpansionTile(
          title: Text(sectionTask),
          subtitle: Text("3/4 tasks"),
          shape: Border(
            top: BorderSide.none,
            bottom: BorderSide.none,
          ),
          childrenPadding: EdgeInsets.symmetric(horizontal: 20),
          tilePadding: EdgeInsets.symmetric(vertical: 5),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          maintainState: true,
          initiallyExpanded: false,
          leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.done_all,color: Colors.white,)),
          children: titleTasks.map((String title){
            return _taskCard(title);
          }).toList(),
        ),
      ),
    );
  }
  Widget _taskCard(String title){
    return Card(
      color: Colors.white,
      child: ListTile(
        title: Text(title),
        leading: Icon(Icons.done),
        trailing: Icon(Icons.check_box_outline_blank),
      ),
    );
  }
  Widget _categoriesTab(String tittle, bool isActive){
    Color activeColor = Colors.lightBlueAccent;
    Color inactiveColor = Colors.white;
    Color activeTextColor = Colors.white;
    Color inactiveTextColor = Colors.black;

    return Chip(
      backgroundColor: isActive?activeColor:inactiveColor,
      label: Text('Aaron Burr',
        style: isActive?kTextStyle.copyWith(color: activeTextColor):kTextStyle.copyWith(color: inactiveTextColor),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      side: BorderSide(
        style: BorderStyle.none,
      ),
    );
  }
}
