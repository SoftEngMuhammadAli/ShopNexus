import 'package:flutter/material.dart';
import 'package:shop_nexus/theme/app_theme.dart';
import 'package:shop_nexus/widgets/button.dart';

class ProductsDetailScreen extends StatelessWidget {
  final String title;
  final String description;
  final double price;
  final String imageUrl;

  const ProductsDetailScreen({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(title: const Text('Product Details'), centerTitle: true),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 360,
                    width: double.infinity,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: imageUrl.isNotEmpty
                              ? Image.network(imageUrl, fit: BoxFit.cover)
                              : Container(
                                  color: Colors.grey.shade200,
                                  child: const Center(
                                    child: Icon(
                                      Icons.image_outlined,
                                      size: 80,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 140,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withAlpha(115),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 18,
                          right: 18,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withAlpha(31),
                                  blurRadius: 12,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.favorite_border),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(32),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: AppTheme.accent.withAlpha(31),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.star,
                                    size: 18,
                                    color: AppTheme.accent,
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    '4.8',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              '(120 reviews)',
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(color: Colors.grey.shade600),
                            ),
                          ],
                        ),
                        const SizedBox(height: 18),
                        Text(
                          'Rs ${price.toStringAsFixed(0)}',
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(
                                color: AppTheme.accent,
                                fontWeight: FontWeight.w800,
                              ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Product details',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          description,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: Colors.grey.shade700,
                                height: 1.6,
                              ),
                        ),
                        const SizedBox(height: 24),
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: [
                            _buildFeatureChip(
                              'Free delivery',
                              Icons.local_shipping_outlined,
                            ),
                            _buildFeatureChip(
                              'Secure payment',
                              Icons.lock_outline,
                            ),
                            _buildFeatureChip(
                              '30-day return',
                              Icons.refresh_outlined,
                            ),
                          ],
                        ),
                        const SizedBox(height: 90),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(20),
              blurRadius: 18,
              offset: const Offset(0, -6),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: CustomButton(
                title: 'Add to cart',
                icon: Icons.shopping_cart_outlined,
                onPressed: () {},
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CustomButton(
                title: 'Buy now',
                color: AppTheme.accent,
                textColor: Colors.white,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureChip(String label, IconData icon) {
    return Chip(
      backgroundColor: AppTheme.background,
      label: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
      avatar: Icon(icon, size: 18, color: AppTheme.primary),
    );
  }
}
