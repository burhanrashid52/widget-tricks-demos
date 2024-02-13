import 'dart:convert';

import 'package:http/http.dart' as http;

var _token = '';

Future<void> login(String username, String password) async {
  final response = await http.post(
    Uri.parse('https://dummyjson.com/auth/login'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    _token = json['token'];
  } else {
    throw Exception('Failed to login');
  }
}

Future<List<String>> getProducts() async {
  final response = await http.get(
    Uri.parse('https://dummyjson.com/products'),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $_token',
    },
  );

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    final products = (json['products'] as List<dynamic>);
    return products.map((e) => e['title'] as String).toList();
  } else {
    throw Exception('Failed to get products');
  }
}
