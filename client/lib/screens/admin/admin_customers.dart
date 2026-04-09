import 'package:flutter/material.dart';
import 'package:shop_nexus/theme/app_theme.dart';
import 'package:shop_nexus/widgets/search.dart';

class AdminCustomersScreen extends StatelessWidget {
  const AdminCustomersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> customers = [
      {'name': 'Mira Shah', 'email': 'mira@example.com', 'orders': 14},
      {'name': 'Amina Khan', 'email': 'amina@example.com', 'orders': 9},
      {'name': 'Tariq Ali', 'email': 'tariq@example.com', 'orders': 18},
    ];

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(title: const Text('Customers')),
      body: Column(
        children: [
          const CustomSearchBar(),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              itemCount: customers.length,
              separatorBuilder: (context, index) => const SizedBox(height: 14),
              itemBuilder: (context, index) {
                final customer = customers[index];
                return Container(
                  padding: const EdgeInsets.all(16),
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
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppTheme.primary.withAlpha(30),
                        child: Text((customer['name'] as String)[0], style: const TextStyle(color: AppTheme.primary)),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(customer['name'] as String, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
                            const SizedBox(height: 6),
                            Text(customer['email'] as String, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey.shade600)),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        decoration: BoxDecoration(
                          color: AppTheme.secondary.withAlpha(30),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Text('${customer['orders']} orders', style: TextStyle(color: AppTheme.secondary, fontWeight: FontWeight.w700)),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
