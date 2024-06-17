// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SalesRecordScreen extends StatefulWidget {
  const SalesRecordScreen({super.key});

  @override
  _SalesRecordScreenState createState() => _SalesRecordScreenState();
}

class _SalesRecordScreenState extends State<SalesRecordScreen> {
  List<dynamic> sales = [];
  bool isLoading = true;
  String errorMessage = '';
  double cumulativeSales = 0.0;

  @override
  void initState() {
    super.initState();
    fetchSales();
  }

  Future<void> fetchSales() async {
    try {
      final response = await http.get(Uri.parse('http://localhost:5000/api/sales'));

      if (response.statusCode == 200) {
        final List<dynamic> salesData = json.decode(response.body);

        // Compute cumulative sales
        double totalCumulativeSales = 0.0;
        for (var sale in salesData) {
          double productPrice = sale['product_price'] ?? 0.0;
          int productQuantity = sale['product_quantity'] ?? 0;
          totalCumulativeSales += productPrice * productQuantity;
        }

        setState(() {
          sales = salesData;
          cumulativeSales = totalCumulativeSales;
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
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/logo.png'),
        ),
        title: const Text('JIPANGE SALES TRACKER - Smart Sales!!'),
      ),
      body: Container(
        color: const Color.fromRGBO(37, 243, 237, 1.0),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : errorMessage.isNotEmpty
                ? Center(child: Text(errorMessage))
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Cumulative Sales: \$${cumulativeSales.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(
                              columns: const [
                                DataColumn(
                                  label: Text(
                                    'Customer',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Product',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Price',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Quantity',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Total Sale',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Date & Time',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
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
                      ),
                    ],
                  ),
      ),
    );
  }
}