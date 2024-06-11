// // ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously, dead_code, empty_statements, prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';
// import 'api_service.dart';

// class SalesTrackerScreen extends StatefulWidget {
//   const SalesTrackerScreen({super.key});

//   @override
//   _SalesTrackerScreenState createState() => _SalesTrackerScreenState();
// }

// class _SalesTrackerScreenState extends State<SalesTrackerScreen> {
//   final ApiService apiService = ApiService();
//   List<dynamic> sales = [];
//   bool isLoading = true;
//   String errorMessage = '';

//   String currentUsername = "John Doe"; // Replace with the actual username
//   String currentLocalTime = "10-06-2024 14:30"; // Replace with actual local time
//   double cumulativeSales = 100000.0; // Replace with actual cumulative sales
//   double monthlyTarget = 150000.0; // Replace with actual monthly target
//   double targetBalance = 50000.0; // Replace with actual target balance
  
//   List<String> customers = ["Customer1", "Customer2", "Customer3"]; // Replace with actual customers list
//   List<Product> products = [ // Replace with actual products list
//     Product(name: "Product1", price: 100.0),
//     Product(name: "Product2", price: 200.0),
//   ];
  
//   String? selectedCustomer;
//   String? selectedProduct;
//   double? productPrice;
//   int? productQuantity;

//   @override
//   void initState() {
//     super.initState();
//     _fetchSales();
//   }

//   void _fetchSales() async {
//     try {
//       final salesData = await apiService.fetchSales();
//       setState(() {
//         sales = salesData;
//         isLoading = false;
//       });
//     } catch (e) {
//       setState(() {
//         errorMessage = e.toString();
//         isLoading = false;
//       // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       //   content: Text('Error: $e'),
//       });
//     }
//   }
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           children: [
//             Image.asset('assets/logo.png', height: 30), // Ensure the logo is in assets
//             const SizedBox(width: 10),
//             const Text("JIPANGE SALES TRACKER - Smart Sales!!"),
//           ],
//         ),
//         actions: [ 
//           TextButton(onPressed: () {}, child: const Text("Home")),
//           TextButton(onPressed: () {}, child: const Text("Reports")),
//           TextButton(onPressed: () {}, child: const Text("Goals")),
//           TextButton(onPressed: () {}, child: const Text("Pipelines")),
//           TextButton(onPressed: () {}, child: const Text("Incentives")),
//           TextButton(onPressed: () {}, child: const Text("Settings")),
//           TextButton(onPressed: () {}, child: const Text("Logout", style: TextStyle(color: Colors.red))),
//         ],
//       ),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("Welcome to Jipange Tracker, $currentUsername!", style: const TextStyle(fontSize: 20)),
//               Text("Current Date and Time: $currentLocalTime", style: const TextStyle(fontSize: 12)),
//               const SizedBox(height: 20),
//               Text("Cumulative Sales: KShs.$cumulativeSales", style: const TextStyle(fontSize: 16)),
//               Text("Monthly Target: KShs.$monthlyTarget", style: const TextStyle(fontSize: 16)),
//               if (targetBalance > 0)
//                 Text("Target Balance: KShs.$targetBalance", style: const TextStyle(fontSize: 16, color: Colors.red))
//               else
//                 Text("Target Surpassed by: KShs.${-targetBalance}", style: const TextStyle(fontSize: 16, color: Colors.green)),
//               const Divider(),
//               Form(
//                 child: Column(
//                   children: [
//                     TextFormField(
//                       initialValue: currentUsername,
//                       decoration: const InputDecoration(labelText: 'User Name'),
//                       readOnly: true,
//                     ),
//                     DropdownButtonFormField<String>(
//                       decoration: const InputDecoration(labelText: 'Customer Name'),
//                       value: selectedCustomer,
//                       onChanged: (value) {
//                         setState(() {
//                           selectedCustomer = value;
//                         });
//                       },
//                       items: customers.map((String customer) {
//                         return DropdownMenuItem<String>(
//                           value: customer,
//                           child: Text(customer),
//                         );
//                       }).toList(),
//                     ),
//                     DropdownButtonFormField<String>(
//                       decoration: const InputDecoration(labelText: 'Product Name'),
//                       value: selectedProduct,
//                       onChanged: (value) {
//                         setState(() {
//                           selectedProduct = value;
//                           productPrice = products.firstWhere((product) => product.name == value).price;
//                         });
//                       },
//                       items: products.map((Product product) {
//                         return DropdownMenuItem<String>(
//                           value: product.name,
//                           child: Text(product.name),
//                         );
//                       }).toList(),
//                     ),
//                     TextFormField(
//                       controller: TextEditingController(text: productPrice?.toString() ?? ''),
//                       decoration: const InputDecoration(labelText: 'Product Price'),
//                       readOnly: true,
//                     ),
//                     TextFormField(
//                       decoration: const InputDecoration(labelText: 'Product Quantity'),
//                       keyboardType: TextInputType.number,
//                       onChanged: (value) {
//                         productQuantity = int.parse(value);
//                       },
//                     ),
//                     const SizedBox(height: 16),
//                     ElevatedButton(
//                       onPressed: () {
//                         // Implement Add Sale action
//                       },
//                       child: const Text('Add Sale'),
//                     ),
//                   ],
//                 ),
//               ),
//               const Divider(),
//               const Text("Sales Records", style: TextStyle(fontSize: 16)),

//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: DataTable(
//                 columns: [
//                   DataColumn(label: Text('User Name')),
//                   DataColumn(label: Text('Customer Name')),
//                   DataColumn(label: Text('Product Name')),
//                   DataColumn(label: Text('Product Price')),
//                   DataColumn(label: Text('Product Quantity')),
//                   DataColumn(label: Text('Total Sale')),
//                   DataColumn(label: Text('Date')),
//                   DataColumn(label: Text('Actions')),
//                   ],
//                   rows: sales.map((sale) {
//                     return DataRow(cells: [
//                       DataCell(Text(sale['userName'] ?? '')),
//                       DataCell(Text(sale['customerName'] ?? '')),
//                       DataCell(Text(sale['productName'] ?? '')),
//                       DataCell(Text(sale['productPrice'].toString())),
//                       DataCell(Text(sale['productQuantity'].toString())),
//                       DataCell(Text(sale['totalSale'].toString())),
//                       DataCell(Text(sale['date'] ?? '')),
//                         DataCell(
//                           Row(
//                           children: [
//                             TextButton(onPressed: () {}, child: Text('Edit')),
//                             TextButton(onPressed: () {}, child: Text('Delete', style: TextStyle(color: Colors.red))),
//                           ],
//                         ),
//                       ),
//                     ]);
//                   }).toList(),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Product {
//   final String name;
//   final double price;

//   Product({required this.name, required this.price});
// }





import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SalesTrackerScreen extends StatefulWidget {
  const SalesTrackerScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SalesTrackerScreenState createState() => _SalesTrackerScreenState();
}

class _SalesTrackerScreenState extends State<SalesTrackerScreen> {
  List<dynamic> sales = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchSales();
  }

  Future<void> fetchSales() async {
    try {
      final response = await http.get(Uri.parse('http://localhost:5000/api/sales'));

      if (response.statusCode == 200) {
        setState(() {
          sales = json.decode(response.body);
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'Failed to load sales: ${response.statusCode}';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Failed to load sales: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sales Tracker'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text(errorMessage))
              : SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text('Customer Name')),
                        DataColumn(label: Text('Product Name')),
                        DataColumn(label: Text('Product Price')),
                        DataColumn(label: Text('Product Quantity')),
                        DataColumn(label: Text('Total Sale')),
                        DataColumn(label: Text('Date')),
                      ],
                      rows: sales.map((sale) {
                        double productPrice = sale['product_price'] ?? 0.0;
                        int productQuantity = sale['product_quantity'] ?? 0;
                        double totalSale = productPrice * productQuantity;

                        return DataRow(cells: [
                          DataCell(Text(sale['customer_name'] ?? '')),
                          DataCell(Text(sale['product_name'] ?? '')),
                          DataCell(Text(productPrice.toString())),
                          DataCell(Text(productQuantity.toString())),
                          DataCell(Text(totalSale.toString())),
                          DataCell(Text(sale['date'] ?? '')),
                        ]);
                      }).toList(),
                    ),
                  ),
                ),
    );
  }
}
