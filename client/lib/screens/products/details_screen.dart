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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text('Product Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 380,
              width: double.infinity,
              decoration: const BoxDecoration(color: Colors.white),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: imageUrl.isNotEmpty
                        ? Image.network(imageUrl, fit: BoxFit.cover)
                        : Container(
                            color: AppTheme.surfaceContainerLow,
                            child: const Center(
                              child: Icon(
                                Icons.image_outlined,
                                size: 80,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            AppTheme.primary.withAlpha(191),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 20,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(224),
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(31),
                            blurRadius: 18,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_border),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    bottom: 24,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(235),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.star, color: AppTheme.primary, size: 18),
                          SizedBox(width: 8),
                          Text(
                            '4.8 • 120 reviews',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppTheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.primary.withAlpha(20),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.local_shipping_outlined,
                              size: 18,
                              color: AppTheme.primary,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Fast delivery',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.surfaceContainerLow,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.lock_outline,
                              size: 18,
                              color: AppTheme.primary,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Secure payment',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Rs ${price.toStringAsFixed(0)}',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppTheme.primary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 26),
                  Text(
                    'Product details',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppTheme.onSurface.withAlpha(184),
                      height: 1.7,
                    ),
                  ),
                  const SizedBox(height: 26),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      _buildFeatureChip(
                        'Free delivery',
                        Icons.local_shipping_outlined,
                      ),
                      _buildFeatureChip('Secure payment', Icons.lock_outline),
                      _buildFeatureChip(
                        '30-day return',
                        Icons.refresh_outlined,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(20),
              blurRadius: 22,
              offset: const Offset(0, -8),
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
                color: AppTheme.primary,
                textColor: AppTheme.onPrimary,
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
      backgroundColor: AppTheme.surfaceContainerLow,
      label: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
      avatar: Icon(icon, size: 18, color: AppTheme.primary),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
    );
  }
}
