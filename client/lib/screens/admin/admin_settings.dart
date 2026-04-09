import 'package:flutter/material.dart';
import 'package:shop_nexus/theme/app_theme.dart';

class AdminSettingsScreen extends StatefulWidget {
  const AdminSettingsScreen({super.key});

  @override
  State<AdminSettingsScreen> createState() => _AdminSettingsScreenState();
}

class _AdminSettingsScreenState extends State<AdminSettingsScreen> {
  bool maintenanceMode = false;
  bool orderNotifications = true;
  bool allowReviews = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(title: const Text('Admin Settings')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        child: Column(
          children: [
            _buildToggleTile(
              title: 'Maintenance mode',
              subtitle: 'Pause new orders and show maintenance banner',
              value: maintenanceMode,
              onChanged: (value) => setState(() => maintenanceMode = value),
            ),
            const SizedBox(height: 14),
            _buildToggleTile(
              title: 'Order notifications',
              subtitle: 'Receive alerts when new orders are placed',
              value: orderNotifications,
              onChanged: (value) => setState(() => orderNotifications = value),
            ),
            const SizedBox(height: 14),
            _buildToggleTile(
              title: 'Product reviews',
              subtitle: 'Allow customers to submit product reviews',
              value: allowReviews,
              onChanged: (value) => setState(() => allowReviews = value),
            ),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
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
                  Text(
                    'Support',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Contact support if you need help with settings, payment providers, or store configuration.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Contact support'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(12),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: SwitchListTile(
        value: value,
        onChanged: onChanged,
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
        subtitle: Text(subtitle),
        activeThumbColor: AppTheme.primary,
        activeTrackColor: AppTheme.primary.withAlpha(50),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }
}
