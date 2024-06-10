import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'register_screen.dart';
import 'sales_tracker_screen.dart';

void main() {
  runApp(const SalesTrackerApp());
}

class SalesTrackerApp extends StatelessWidget {
  const SalesTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jipange Sales Tracker',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/sales': (context) => const SalesTrackerScreen(),
      },
    );
  }
}











