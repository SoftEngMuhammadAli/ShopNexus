import 'package:go_router/go_router.dart';
import 'package:shop_nexus/features/auth/presentation/screens/login_screen.dart';
import 'package:shop_nexus/features/auth/presentation/screens/register_screen.dart';
import 'package:shop_nexus/features/home/presentation/screens/home_screen.dart';
import 'package:shop_nexus/features/products/presentation/screens/product_list_screen.dart';
import 'package:shop_nexus/features/products/presentation/screens/product_detail_screen.dart';
import 'package:shop_nexus/features/cart/presentation/screens/cart_screen.dart';
import 'package:shop_nexus/features/profile/presentation/screens/profile_screen.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/products',
      builder: (context, state) => const ProductListScreen(),
    ),
    GoRoute(
      path: '/product/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return ProductDetailScreen(productId: id);
      },
    ),
    GoRoute(path: '/cart', builder: (context, state) => const CartScreen()),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
  ],
  initialLocation: '/login',
);
