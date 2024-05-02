import 'package:efecto/core/theme.dart';
import 'package:efecto/features/home/application/home_bloc.dart';
import 'package:efecto/features/home/application/views/home_view.dart';
import 'package:efecto/features/initialscreens/application/bloc/auth_bloc.dart';
import 'package:efecto/features/initialscreens/application/views/login_view.dart';
import 'package:efecto/features/initialscreens/application/views/welcome_screen.dart';
import 'package:efecto/features/timer/application/views/timer_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/hive_initializer.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase Initialisation
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //initialise hive
  await initializeHive();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      initialRoute: (FirebaseAuth.instance.currentUser != null)
          ? HomeView.routeName
          : WelcomeScreen.routeName,
      // initialRoute: TimerScreen.routeName,
      routes: {
        WelcomeScreen.routeName: (ctx) => const WelcomeScreen(),
        LoginView.routeName: (ctx) => BlocProvider(
              create: (BuildContext context) => AuthBloc(),
              child: const LoginView(),
            ),
        HomeView.routeName: (ctx) => BlocProvider(
              create: (BuildContext context) => HomeBloc(),
              child: const HomeView(),
            ),
        TimerScreen.routeName: (ctx) => const TimerScreen(),
      },
    );
  }
}
