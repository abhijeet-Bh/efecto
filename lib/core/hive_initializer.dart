import 'package:hive_flutter/adapters.dart';

import 'auth_data_box.dart';

Future<void> initializeHive() async {
  await Hive.initFlutter();
  // Get the application documents directory

  // Register your Hive adapters here if needed
  // Hive.registerAdapter(YourAdapter());

  // Open Hive boxes or perform other initialization tasks
  AuthTokenBox.setBox(await Hive.openBox('authBox'));
  UserInfoBox.setBox(await Hive.openBox('infoBox'));

  // Add more boxes or initialization steps as needed
}
