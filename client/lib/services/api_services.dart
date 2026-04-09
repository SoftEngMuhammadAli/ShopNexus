import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiServices {
  static const String baseUrl = 'https://dummyjson.com';

  // Example of an API endpoint
  static const String getUserEndpoint = '$baseUrl/users';
  static const String getPostsEndpoint = '$baseUrl/products';

  // Example to Fetch Users
  Future<List<dynamic>> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse(getUserEndpoint));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['users']; // Assuming the API returns a 'users' array
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      debugPrint('Error fetching users: $e');
      rethrow;
    }
  }

  // Example to Fetch Products
  Future<List<dynamic>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(getPostsEndpoint));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['products']; // Assuming the API returns a 'products' array
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      debugPrint('Error fetching products: $e');
      rethrow;
    }
  }
}
