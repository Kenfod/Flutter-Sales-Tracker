import 'package:flutter/material.dart';

import 'sales_tracker_screen.dart';
// import 'register_screen.dart';
// import 'sales_tracker_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JIPANGE SALES TRACKER - Smart Sales!!'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Image(
                image: AssetImage('assets/logo.png'),
                height: 100,
              ),
            ),
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
                // onPressed: () {
                //   Navigator.pushNamed(context, '/sales_tracker');
                //     },
                    
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SalesTrackerScreen()),
                   );
              },
                  // child: const Text('Go to Sales Tracker'),
                  // Handle login logic here

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
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text('Login Screen'),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, '/register');
//               },
//               child: Text('Go to Register'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, '/sales_tracker');
//               },
//               child: Text('Go to Sales Tracker'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
