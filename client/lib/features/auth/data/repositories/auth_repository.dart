import 'package:shop_nexus/core/network/api_client.dart';
import 'package:shop_nexus/features/auth/data/models/login_request.dart';
import 'package:shop_nexus/features/auth/data/models/login_response.dart';
import 'package:shop_nexus/features/auth/data/services/auth_service.dart';

class AuthRepository {
  final AuthService _authService;

  AuthRepository(ApiClient apiClient) : _authService = AuthService(apiClient);

  Future<LoginResponse> login(LoginRequest request) async {
    return await _authService.login(request);
  }

  Future<Map<String, dynamic>> register(Map<String, dynamic> data) async {
    return await _authService.register(data);
  }
}
