import 'package:flutter/material.dart';
import 'package:shop_nexus/routes/routers.dart';
import 'package:shop_nexus/theme/app_theme.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  Widget _buildTile(
    BuildContext context,
    IconData icon,
    String title,
    String route,
  ) {
    return ListTile(
      leading: Icon(icon, color: AppTheme.primary),
      title: Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
      ),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, route);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppTheme.background,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppTheme.primaryContainer, AppTheme.primary],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(32),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shop Nexus',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Premium collections, curated for you',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: Colors.white70),
                  ),
                ],
              ),
            ),
            _buildTile(context, Icons.home_outlined, 'Home', AppRoutes.home),
            _buildTile(
              context,
              Icons.shopping_bag_outlined,
              'Products',
              AppRoutes.products,
            ),
            const Divider(height: 1, thickness: 1),
            _buildTile(
              context,
              Icons.person_outline,
              'My Profile',
              AppRoutes.userProfile,
            ),
            _buildTile(
              context,
              Icons.receipt_long_outlined,
              'My Orders',
              AppRoutes.userOrders,
            ),
            _buildTile(
              context,
              Icons.favorite_border,
              'Wishlist',
              AppRoutes.userWishlist,
            ),
            _buildTile(
              context,
              Icons.settings_outlined,
              'Account Settings',
              AppRoutes.userSettings,
            ),
            const Divider(height: 1, thickness: 1),
            _buildTile(context, Icons.login_outlined, 'Login', AppRoutes.login),
            _buildTile(
              context,
              Icons.app_registration_outlined,
              'Register',
              AppRoutes.register,
            ),
            _buildTile(
              context,
              Icons.admin_panel_settings_outlined,
              'Admin Dashboard',
              AppRoutes.admin,
            ),
          ],
        ),
      ),
    );
  }
}
