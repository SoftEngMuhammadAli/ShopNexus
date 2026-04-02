import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop_nexus/core/constants/app_constants.dart';

class ApiClient {
  final http.Client _client;

  ApiClient({http.Client? client}) : _client = client ?? http.Client();

  Future<Map<String, dynamic>> post(
    String endpoint,
    Map<String, dynamic> data,
  ) async {
    final url = Uri.parse('${AppConstants.apiBaseUrl}$endpoint');
    final response = await _client.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to post: ${response.statusCode}');
    }
  }

  Future<Map<String, dynamic>> get(String endpoint) async {
    final url = Uri.parse('${AppConstants.apiBaseUrl}$endpoint');
    final response = await _client.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get: ${response.statusCode}');
    }
  }

  void dispose() {
    _client.close();
  }
}
