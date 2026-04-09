import 'package:flutter/material.dart';
import 'package:shop_nexus/theme/app_theme.dart';

class ProductCard extends StatelessWidget {
  final String? title;
  final String? description;
  final double? price;
  final String? imageUrl;
  final Function()? onTap;

  const ProductCard({
    super.key,
    this.title,
    this.description,
    this.price,
    this.imageUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 240,
        height: 280,
        decoration: AppTheme.cardDecoration(),
        clipBehavior: Clip.hardEdge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 170,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: imageUrl != null && imageUrl!.isNotEmpty
                        ? Image.network(imageUrl!, fit: BoxFit.cover)
                        : Container(
                            color: AppTheme.surfaceContainerLow,
                            child: const Center(
                              child: Icon(
                                Icons.image_outlined,
                                size: 56,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                  ),
                  Positioned(
                    top: 14,
                    left: 14,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.primary.withAlpha(230),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Text(
                        'Premium',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 14,
                    right: 14,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(235),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(20),
                            blurRadius: 16,
                          ),
                        ],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.favorite_border,
                          size: 18,
                          color: AppTheme.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? 'Product Name',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description ?? 'Stylish details for modern living',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppTheme.onSurface.withAlpha(174),
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rs ${price?.toStringAsFixed(0) ?? '0'}',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: AppTheme.primary,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppTheme.primary.withAlpha(20),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(
                          Icons.shopping_bag_outlined,
                          size: 18,
                          color: AppTheme.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
