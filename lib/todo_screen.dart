import 'package:flutter/material.dart';

List<Map<String, bool>> tasks = [
  {"Hoc lap trinh ": false},
  {"Lap trinh flutter ": false},
  {"Lap trinh extension ": false},
  {"Learning english ": true},
  {"cleaning the house": true},
  {"buy a cup coffee": true},
];

class Todo extends StatefulWidget {
  const Todo({super.key});

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
              itemCount: tasks.length,
              itemBuilder: (BuildContext context, int index) {
                String task = tasks[index].keys.first;
                bool value = tasks[index].values.first;
                return ListTile(
                  onTap: (){
                    setState(() {
                      if(value == true){
                        tasks[index][task] = false;
                      } else{
                        tasks[index][task] = true;
                      }
                    });
                  },
                  onLongPress: (){
                    setState(() {
                      if(value == true){
                        tasks[index][task] = false;
                      } else{
                        tasks[index][task] = true;
                      }
                    });
                  },
                  title: Text(task,
                    style: TextStyle(
                      decoration: tasks[index][task]!?TextDecoration.lineThrough:null,
                    ),
                  ),
                  trailing: Checkbox(
                    value: tasks[index].values.first,
                    activeColor: Colors.lightBlueAccent,
                    onChanged: (value){
                      setState(() {
                        tasks[index][task] = value!;
                      });
                    },  
                    ),
                  );
              },
            )),
      ),
    );
    
  }
}
