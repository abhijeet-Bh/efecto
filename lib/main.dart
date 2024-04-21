import 'package:efecto/core/theme.dart';
import 'package:efecto/features/home/application/views/home_view.dart';
import 'package:efecto/features/initialscreens/application/views/login_view.dart';
import 'package:efecto/features/initialscreens/application/views/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      initialRoute: WelcomeScreen.routeName,
      routes: {
        WelcomeScreen.routeName: (ctx) => const WelcomeScreen(),
        LoginView.routeName: (ctx) => const LoginView(),
        HomeView.routeName: (ctx) => const HomeView(),
      },
    );
  }
}
