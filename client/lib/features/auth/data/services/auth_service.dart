import 'package:shop_nexus/core/network/api_client.dart';
import 'package:shop_nexus/features/auth/data/models/login_request.dart';
import 'package:shop_nexus/features/auth/data/models/login_response.dart';

class AuthService {
  final ApiClient _apiClient;

  AuthService(this._apiClient);

  Future<LoginResponse> login(LoginRequest request) async {
    final response = await _apiClient.post('/auth/login', request.toJson());
    return LoginResponse.fromJson(response);
  }

  Future<Map<String, dynamic>> register(Map<String, dynamic> data) async {
    return await _apiClient.post('/auth/register', data);
  }
}
