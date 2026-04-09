import 'package:flutter/material.dart';
import 'package:shop_nexus/theme/app_theme.dart';

class UserSettingsScreen extends StatefulWidget {
  const UserSettingsScreen({super.key});

  @override
  State<UserSettingsScreen> createState() => _UserSettingsScreenState();
}

class _UserSettingsScreenState extends State<UserSettingsScreen> {
  bool _notifications = true;
  bool _emailUpdates = false;
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Account settings'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              'Preferences',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 18),
            _settingTile(
              title: 'Push notifications',
              subtitle: 'Receive updates about deals and orders',
              value: _notifications,
              onChanged: (value) {
                setState(() {
                  _notifications = value;
                });
              },
            ),
            _settingTile(
              title: 'Email offers',
              subtitle: 'Get exclusive offers in your inbox',
              value: _emailUpdates,
              onChanged: (value) {
                setState(() {
                  _emailUpdates = value;
                });
              },
            ),
            _settingTile(
              title: 'Dark mode',
              subtitle: 'Switch the app appearance',
              value: _darkMode,
              onChanged: (value) {
                setState(() {
                  _darkMode = value;
                });
              },
            ),
            const SizedBox(height: 24),
            Text(
              'Security',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 14),
            _optionTile(context, Icons.lock_outline, 'Change password'),
            _optionTile(context, Icons.fingerprint, 'Manage authentication'),
            _optionTile(context, Icons.privacy_tip_outlined, 'Privacy options'),
          ],
        ),
      ),
    );
  }

  Widget _settingTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.black54),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            activeThumbColor: AppTheme.primary,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Widget _optionTile(BuildContext context, IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        leading: Icon(icon, color: AppTheme.primary),
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.black26),
        onTap: () {},
      ),
    );
  }
}
