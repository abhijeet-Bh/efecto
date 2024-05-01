import 'package:hive_flutter/hive_flutter.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final int priority;
  @HiveField(3)
  final int duration;
  @HiveField(4)
  final bool isComplete;
  @HiveField(5)
  final DateTime date;

  TaskModel(
    this.id,
    this.title,
    this.priority,
    this.duration,
    this.isComplete,
    this.date,
  );
}
