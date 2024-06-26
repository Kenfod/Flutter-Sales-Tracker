// ignore_for_file: unused_import, non_constant_identifier_names

import 'package:flutter/material.dart';
 import 'login_screen.dart';
 import 'register_screen.dart';
import 'sales_record_screen.dart';

void main() {
  runApp(const SalesTrackerApp());
}

class SalesTrackerApp extends StatelessWidget {
  const SalesTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  // hide debug banner
      title: 'Jipange Sales Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: const Color.fromRGBO(37, 150, 190, 1)),  // Set primary color
        useMaterial3: false,  // Enable Material 3 design elements
        // primarySwatch: Colors.green,
      ),
      initialRoute: '/login',
      routes: {
         '/login': (context) => const LoginScreen(),
         '/register': (context) => const RegisterScreen(),
         '/sales': (context) => SalesRecordScreen(),
      },
    );
  }
  
  SalesRecordScreen() {}
}
