class Task {
  late String nameTask;
  late bool isDone;
  Task({required this.nameTask,this.isDone = false});
  void getDoneTask(){
    isDone = !isDone;
  }
}