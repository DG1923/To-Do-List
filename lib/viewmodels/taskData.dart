import 'package:flutter/foundation.dart';
import 'package:to_do_list/models/task.dart';
class Taskdata extends ChangeNotifier{
  List<Task> taskTodo = [
    Task(nameTask: "Hoc lap trinh"),
    Task(nameTask: "Viet app mobile"),
    Task(nameTask: "Cleaning the house"),
    Task(nameTask: "buy a cup of coffee"),
    Task(nameTask: "Lap trinh extension  fsdf"),
    Task(nameTask: "Hieu provider trong flutter"),
  ];
  void deleteData(int index){
    taskTodo.removeAt(index);
    notifyListeners();
  }
  void addData(Task task){
    taskTodo.add(task);
    notifyListeners();
  }
  void isDone(int index){
    taskTodo[index].isDone = !taskTodo[index].isDone;
    notifyListeners();
  }
  int get getCount{
    return taskTodo.length;
  }
}