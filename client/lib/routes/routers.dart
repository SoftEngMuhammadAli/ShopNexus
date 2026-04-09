import 'package:flutter/material.dart';
import 'package:shop_nexus/screens/admin/admin_dashboard.dart';
import 'package:shop_nexus/screens/auth/forget_password.dart';
import 'package:shop_nexus/screens/auth/login_screen.dart';
import 'package:shop_nexus/screens/auth/register_screen.dart';
import 'package:shop_nexus/screens/home/home_screen.dart';
import 'package:shop_nexus/screens/products/products_screen.dart';

class AppRoutes {
  static const String home = "/home";
  static const String login = "/login";
  static const String register = "/register";
  static const String forgetPassword = "/forget-password";
  static const String products = "/products";
  static const String admin = "/admin";
  static const String productDetails = "/product-details";

  static final Map<String, WidgetBuilder> routes = {
    home: (context) => HomeScreen(),
    login: (context) => const LoginScreen(),
    register: (context) => const RegisterScreen(),
    forgetPassword: (context) => const ForgetPasswordScreen(),
    products: (context) => ProductsScreen(),
    admin: (context) => const AdminDashboardScreen(),
  };
}
