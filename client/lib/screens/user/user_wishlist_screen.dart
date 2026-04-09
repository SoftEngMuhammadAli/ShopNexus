import 'package:flutter/material.dart';
import 'package:shop_nexus/theme/app_theme.dart';
import 'package:shop_nexus/widgets/product_card.dart';
import 'package:shop_nexus/screens/products/details_screen.dart';

class UserWishlistScreen extends StatelessWidget {
  UserWishlistScreen({super.key});

  final List<Map<String, dynamic>> _wishlist = [
    {
      'title': 'Minimal Designer Lamp',
      'description': 'Warm light, modern silhouette',
      'price': 49.00,
      'thumbnail': 'https://images.pexels.com/photos/112811/pexels-photo-112811.jpeg',
    },
    {
      'title': 'Compact Smart Watch',
      'description': 'Fitness tracking with style',
      'price': 179.00,
      'thumbnail': 'https://images.pexels.com/photos/277395/pexels-photo-277395.jpeg',
    },
    {
      'title': 'Noise Cancelling Headphones',
      'description': 'Immersive sound experience',
      'price': 229.00,
      'thumbnail': 'https://images.pexels.com/photos/339466/pexels-photo-339466.jpeg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Wishlist'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Saved favorites',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 14),
            Expanded(
              child: ListView.separated(
                itemCount: _wishlist.length,
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final item = _wishlist[index];
                  return ProductCard(
                    title: item['title'],
                    description: item['description'],
                    price: item['price'],
                    imageUrl: item['thumbnail'],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductsDetailScreen(
                            title: item['title'],
                            description: item['description'],
                            price: item['price'],
                            imageUrl: item['thumbnail'],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
