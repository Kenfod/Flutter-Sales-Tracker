// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class SalesTrackerScreen extends StatefulWidget {
//   const SalesTrackerScreen({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _SalesTrackerScreenState createState() => _SalesTrackerScreenState();
// }

// class _SalesTrackerScreenState extends State<SalesTrackerScreen> {
//   List<dynamic> sales = [];
//   bool _isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//     fetchSales();
//   }

//   Future<void> fetchSales() async {
//     setState(() {
//       _isLoading = true;
//     });

//     final response = await http.get(Uri.parse('http://localhost:5000/api/sales'));

//     setState(() {
//       _isLoading = false;
//     });

//     if (response.statusCode == 200) {
//       setState(() {
//         sales = json.decode(response.body);
//       });
//     } else {
//       // ignore: use_build_context_synchronously
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Failed to load sales')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Sales Tracker'),
//       ),
//       body: _isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : sales.isEmpty
//               ? const Center(child: Text('No sales data available'))
//               : ListView.builder(
//                   itemCount: sales.length,
//                   itemBuilder: (context, index) {
//                     final sale = sales[index];
//                     return ListTile(
//                       title: Text('Customer: ${sale['customer_name']}'),
//                       subtitle: Text('Product: ${sale['product_name']}'),
//                       trailing: Text('Quantity: ${sale['product_quantity']}'),
//                     );
//                   },
//                 ),
//     );
//   }
// }











// // import 'package:flutter/material.dart';
// // import 'dart:convert';
// // import 'package:http/http.dart' as http;

// // class SalesTrackerScreen extends StatefulWidget {
// //   const SalesTrackerScreen({super.key});

// //   @override
// //   // ignore: library_private_types_in_public_api
// //   _SalesTrackerScreenState createState() => _SalesTrackerScreenState();
// // }

// // class _SalesTrackerScreenState extends State<SalesTrackerScreen> {
// //   List<dynamic> sales = [];

// //   @override
// //   void initState() {
// //     super.initState();
// //     fetchSales();
// //   }

// //   Future<void> fetchSales() async {
// //     final response = await http.get(Uri.parse('http://localhost:5000/api/sales'));

// //     if (response.statusCode == 200) {
// //       setState(() {
// //         sales = json.decode(response.body);
// //       });
// //     } else {
// //       throw Exception('Failed to load sales');
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Sales Tracker'),
// //       ),
// //       body: sales.isEmpty
// //           ? const Center(child: CircularProgressIndicator())
// //           : ListView.builder(
// //               itemCount: sales.length,
// //               itemBuilder: (context, index) {
// //                 final sale = sales[index];
// //                 return ListTile(
// //                   title: Text('Customer: ${sale['customer_name']}'),
// //                   subtitle: Text('Product: ${sale['product_name']}'),
// //                   trailing: Text('Quantity: ${sale['product_quantity']}'),
// //                 );
// //               },
// //             ),
// //     );
// //   }
// // }
