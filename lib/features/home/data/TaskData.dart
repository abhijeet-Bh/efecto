class TaskData {
  static List<TaskModel> taskList = [
    TaskModel(
      title: "Task Title",
      duration: 190,
      priority: Priority.HIGH,
    )
  ];
}

class TaskModel {
  String title;
  int duration;
  Priority priority;

  TaskModel(
      {required this.title, required this.duration, required this.priority});
}

enum Priority { HIGH, MEDIUM, LOW }
