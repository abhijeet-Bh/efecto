import 'package:efecto/core/task_model.dart';

class TaskData {
  static List<TaskModel> taskList = [
    TaskModel(
      "sampleId",
      "First Test Task",
      2,
      25,
      false,
      DateTime.now(),
    ),
    TaskModel(
      "sampleId",
      "Second Test Task",
      1,
      30,
      false,
      DateTime.now(),
    ),
    TaskModel(
      "sampleId",
      "Third Test Task",
      0,
      45,
      false,
      DateTime.now(),
    ),
  ];
}
