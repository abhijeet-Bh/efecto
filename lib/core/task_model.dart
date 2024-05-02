import 'package:hive_flutter/hive_flutter.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel {
  @HiveField(0)
  String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  int priority;
  @HiveField(3)
  int duration;
  @HiveField(4)
  bool isComplete;
  @HiveField(5)
  DateTime date;
  @HiveField(6)
  int progress;

  TaskModel(
    this.id,
    this.title,
    this.priority,
    this.duration,
    this.isComplete,
    this.date,
    this.progress,
  );
}
