import 'package:shop_nexus/features/auth/data/models/user_model.dart';

class LoginResponse {
  final bool success;
  final String message;
  final UserModel user;
  final String token;

  LoginResponse({
    required this.success,
    required this.message,
    required this.user,
    required this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json['success'],
      message: json['message'],
      user: UserModel.fromJson(json['user']),
      token: json['token'],
    );
  }
}
