import 'package:efecto/core/task_data_box.dart';
import 'package:efecto/core/task_model.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> initializeHive() async {
  await Hive.initFlutter();
  // Get the application documents directory

  // Register your Hive adapters here if needed
  // Hive.registerAdapter(YourAdapter());
  Hive.registerAdapter(TaskModelAdapter());

  // Open Hive boxes or perform other initialization tasks
  // AuthTokenBox.setBox(await Hive.openBox('authBox'));
  TaskDataBox.setBox(await Hive.openBox<TaskModel>('tasks'));

  // Add more boxes or initialization steps as needed
}
