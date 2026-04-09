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
        width: double.infinity,
        constraints: const BoxConstraints(minHeight: 240, maxHeight: 260),
        decoration: AppTheme.cardDecoration(),
        clipBehavior: Clip.hardEdge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 140,
              width: double.infinity,
              child: imageUrl != null
                  ? Image.network(imageUrl!, fit: BoxFit.cover)
                  : Container(
                      color: Colors.grey.shade100,
                      child: const Center(
                        child: Icon(
                          Icons.image_outlined,
                          size: 56,
                          color: Colors.grey,
                        ),
                      ),
                    ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title ?? 'Product Name',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          description ?? 'Short description here',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Colors.grey.shade600,
                                height: 1.4,
                              ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rs ${price?.toStringAsFixed(0) ?? '0'}',
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                color: AppTheme.accent,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppTheme.accent.withAlpha(36),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.shopping_cart_outlined,
                            size: 18,
                            color: AppTheme.accent,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
