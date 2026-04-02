import 'package:go_router/go_router.dart';
import 'package:shop_nexus/screens/admin/admin_dashboard.dart';
import 'package:shop_nexus/screens/auth/forget_password.dart';
import 'package:shop_nexus/screens/auth/login_screen.dart';
import 'package:shop_nexus/screens/auth/register_screen.dart';
import 'package:shop_nexus/screens/auth/verify_password.dart';
import 'package:shop_nexus/screens/home/home_screen.dart';
import 'package:shop_nexus/screens/products/details_screen.dart';
import 'package:shop_nexus/screens/products/products_screen.dart';

final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        // User Authentication Routes
        GoRoute(
          path: "/login",
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: "/register",
          builder: (context, state) => const RegisterScreen(),
        ),
        GoRoute(
          path: "/forget-password",
          builder: (context, state) => const ForgetPasswordScreen(),
        ),
        GoRoute(
          path: "/verify-password",
          builder: (context, state) => const VerifyPasswordScreen(),
        ),
        // User Routes
        GoRoute(
          path: "/products",
          builder: (context, state) => const ProductsScreen(),
          routes: [
            GoRoute(
              path: 'details/:id',
              builder: (context, state) {
                return ProductsDetailScreen();
              },
            ),
          ],
        ),
        // Admin Routes
        GoRoute(
          path: "/admin/dashboard",
          builder: (context, state) => const AdminDashboardScreen(),
        ),
      ],
    ),
  ],
);
