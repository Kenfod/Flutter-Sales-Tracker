import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://127.0.0.1:5000';
  // static const String baseUrl = 'http://localhost:5000/api/sales';

  // Login
  Future<Map<String, dynamic>> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to login');
    }
  }

  // Register
  Future<Map<String, dynamic>> register(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to register');
    }
  }

  // Fetch Sales
  Future<List<dynamic>> fetchSales() async {
    final response = await http.get(Uri.parse('$baseUrl/sales'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load sales');
    }
  }

  Future<void> addSale(Map<String, dynamic> saleData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/add_sale'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(saleData),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to add sale');
    }
  }
}

      // Add Sale
//   Future<Map<String, dynamic>> addSale(Map<String, dynamic> sale) async {
//     final response = await http.post(
//       Uri.parse('$baseUrl/sales'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(sale),
//     );

//     if (response.statusCode == 200) {
//       return jsonDecode(response.body);
//     } else {
//       throw Exception('Failed to add sale');
//     }
//   }
// }




// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class ApiService {
//   final String baseUrl = 'http://192.168.1.2:5000'; // Replace with your server IP address

//   Future<List<dynamic>> fetchSales() async {
//     final response = await http.get(Uri.parse('$baseUrl/sales'));
//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       throw Exception('Failed to load sales');
//     }
//   }

//   Future<void> addSale(Map<String, dynamic> saleData) async {
//     final response = await http.post(
//       Uri.parse('$baseUrl/add_sale'),
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode(saleData),
//     );
//     if (response.statusCode != 201) {
//       throw Exception('Failed to add sale');
//     }
//   }
// }