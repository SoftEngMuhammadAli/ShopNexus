import 'package:flutter/material.dart';
import 'package:shop_nexus/theme/app_theme.dart';

class AdminOrdersScreen extends StatelessWidget {
  const AdminOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = [
      {
        'id': '#8421',
        'customer': 'Mira Shah',
        'total': 'Rs 6,120',
        'status': 'Shipped',
        'date': 'Today',
      },
      {
        'id': '#8419',
        'customer': 'Amina Khan',
        'total': 'Rs 3,490',
        'status': 'Processing',
        'date': 'Yesterday',
      },
      {
        'id': '#8415',
        'customer': 'Tariq Ali',
        'total': 'Rs 9,200',
        'status': 'Delivered',
        'date': '2 days ago',
      },
    ];

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(title: const Text('Orders Management')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        child: ListView.separated(
          itemCount: orders.length,
          separatorBuilder: (context, index) => const SizedBox(height: 14),
          itemBuilder: (context, index) {
            final order = orders[index];
            return Container(
              padding: const EdgeInsets.all(18),
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
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppTheme.primary.withAlpha(30),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.shopping_bag_outlined,
                      color: AppTheme.primary,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order['id']!,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          order['customer']!,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            _buildStatusChip(order['status']!),
                            const SizedBox(width: 10),
                            Text(
                              order['date']!,
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(color: Colors.grey.shade600),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(
                    order['total']!,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    final colors = {
      'Shipped': AppTheme.error,
      'Processing': AppTheme.primary,
      'Delivered': Colors.green,
    };
    final color = colors[status] ?? Colors.grey;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withAlpha(30),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(
        status,
        style: TextStyle(color: color, fontWeight: FontWeight.w700),
      ),
    );
  }
}
