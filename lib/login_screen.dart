// ignore_for_file: library_private_types_in_public_api, unused_element, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'api_service.dart';
import 'sales_record_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ApiService apiService = ApiService();

  void _login() async {
    try {
      final response = await apiService.login(
        _usernameController.text,
        _passwordController.text,
      );

      if (response['status'] == 'success') {
        Navigator.pushNamed(context, '/salesTracker');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Login failed'),
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error: $e'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/logo.png'),
        ),
        title: const Text('JIPANGE SALES TRACKER - Smart Sales!!'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Login',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: const TextStyle(fontSize: 18),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: const TextStyle(fontSize: 18),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(    
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SalesRecordScreen()),
                   );
                  },
                  child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 18),
                  
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: TextButton(
                onPressed: () {
                  // Navigate to the registration screen
                  Navigator.pushNamed(context, '/register');
                },
                child: const Text("Don't have an account? Register"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}










// import 'package:flutter/material.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text('Login Screen'),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, '/register');
//               },
//               child: const Text('Go to Register'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, '/sales_tracker');
//               },
//               child: const Text('Go to Sales Tracker'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }





