import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_nexus/routes/routers.dart';
import 'package:shop_nexus/screens/home/home_screen.dart';
import 'package:shop_nexus/theme/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop Nexus',
      theme: AppTheme.lightTheme,
      home: HomeScreen(),
      routes: AppRoutes.routes,
    );
  }
}
