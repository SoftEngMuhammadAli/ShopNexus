import 'package:flutter/material.dart';
import 'package:shop_nexus/routes/routers.dart';
import 'package:shop_nexus/theme/app_theme.dart';
import 'package:shop_nexus/widgets/button.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 24),
            _buildSectionHeader(
              context,
              'Store overview',
              'View full report',
              () {},
            ),
            const SizedBox(height: 16),
            _buildSummaryGrid(context),
            const SizedBox(height: 24),
            _buildSectionHeader(context, 'Quick actions', 'Manage', () {}),
            const SizedBox(height: 16),
            _buildActionGrid(context),
            const SizedBox(height: 24),
            _buildSectionHeader(context, 'Recent orders', 'See all', () {}),
            const SizedBox(height: 16),
            _buildRecentOrder(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppTheme.primary, AppTheme.secondary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(25),
            blurRadius: 22,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome back, Admin',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Monitor your store performance and manage orders, products, and customers from one place.',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.white70),
          ),
          const SizedBox(height: 20),
          CustomButton(title: 'View analytics', width: 160, onPressed: () {}),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(
    BuildContext context,
    String title,
    String action,
    VoidCallback onTap,
  ) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
        ),
        const Spacer(),
        TextButton(onPressed: onTap, child: Text(action)),
      ],
    );
  }

  Widget _buildSummaryGrid(BuildContext context) {
    final cards = [
      _SummaryCardData(
        'Total sales',
        '12.4K',
        Icons.show_chart,
        AppTheme.surfaceContainerLow,
      ),
      _SummaryCardData('Orders', '1,980', Icons.shopping_bag, AppTheme.primary),
      _SummaryCardData('Products', '320', Icons.inventory_2, Colors.orange),
      _SummaryCardData('Customers', '1.2K', Icons.people, Colors.purple),
    ];

    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: cards.map((data) => _buildSummaryCard(context, data)).toList(),
    );
  }

  Widget _buildSummaryCard(BuildContext context, _SummaryCardData data) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 24,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(12),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: data.color.withAlpha(30),
              borderRadius: BorderRadius.circular(14),
            ),
            padding: const EdgeInsets.all(10),
            child: Icon(data.icon, color: data.color, size: 22),
          ),
          const SizedBox(height: 18),
          Text(
            data.value,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 8),
          Text(
            data.title,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }

  Widget _buildActionGrid(BuildContext context) {
    final items = [
      _ActionTileData(
        'Manage products',
        Icons.inventory_2_outlined,
        AppTheme.primary,
        AppRoutes.adminProducts,
      ),
      _ActionTileData(
        'Orders',
        Icons.receipt_long_outlined,
        AppTheme.secondary,
        AppRoutes.adminOrders,
      ),
      _ActionTileData(
        'Customers',
        Icons.people_outline,
        Colors.purple,
        AppRoutes.adminCustomers,
      ),
      _ActionTileData(
        'Settings',
        Icons.settings_outlined,
        Colors.grey.shade700,
        AppRoutes.adminSettings,
      ),
    ];

    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: items.map((data) => _buildActionTile(context, data)).toList(),
    );
  }

  Widget _buildActionTile(BuildContext context, _ActionTileData data) {
    return InkWell(
      onTap: () {
        if (data.route != null) {
          Navigator.pushNamed(context, data.route!);
        }
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - 24,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(10),
              blurRadius: 18,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: data.color.withAlpha(28),
                borderRadius: BorderRadius.circular(14),
              ),
              padding: const EdgeInsets.all(12),
              child: Icon(data.icon, color: data.color, size: 22),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                data.title,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentOrder(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(12),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order #3841',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Placed 2 hours ago · Processing',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.secondary.withAlpha(30),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(
                  'High priority',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppTheme.secondary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          _buildOrderDetail(context, 'Customer', 'Sara Khan'),
          const SizedBox(height: 12),
          _buildOrderDetail(context, 'Items', '4 products'),
          const SizedBox(height: 12),
          _buildOrderDetail(context, 'Total', 'Rs 18,450'),
          const SizedBox(height: 20),
          CustomButton(title: 'Review order', onPressed: () {}),
        ],
      ),
    );
  }

  Widget _buildOrderDetail(BuildContext context, String label, String value) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.grey.shade600),
          ),
        ),
        Text(
          value,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}

class _SummaryCardData {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  _SummaryCardData(this.title, this.value, this.icon, this.color);
}

class _ActionTileData {
  final String title;
  final IconData icon;
  final Color color;
  final String? route;

  _ActionTileData(this.title, this.icon, this.color, [this.route]);
}
