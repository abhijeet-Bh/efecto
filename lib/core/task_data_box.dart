import 'package:efecto/core/task_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TaskDataBox {
  static late Box<TaskModel> _box;

  static setBox(Box<TaskModel> box) {
    _box = box;
  }

  static Future<bool> storeNewTask(TaskModel task) async {
    try {
      await _box.put(task.id, task);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<List<TaskModel>?> ageAllTasks(DateTime date) async {
    List<TaskModel> tasks = [];
    var taskList = _box.values;

    for (var task in taskList) {
      if (task.date.day == date.day &&
          task.date.month == date.month &&
          task.date.year == date.year) {
        tasks.add(task);
      }
    }

    return tasks;
  }

  static Future<TaskModel?> getSingleTask(String id) async {
    return _box.get(id);
  }

  static Future<bool> updateTask(TaskModel task) async {
    try {
      await _box.put(task.id, task);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> deleteTask(String id) async {
    try {
      await _box.delete(id);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<void> clear() async {
    await _box.clear();
  }
}
