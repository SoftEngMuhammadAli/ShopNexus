import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_nexus/features/products/presentation/screens/product_list_screen.dart';
import 'package:shop_nexus/shared/widgets/custom_button.dart';

class ProductDetailScreen extends StatelessWidget {
  final String productId;

  const ProductDetailScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final product = ProductListScreen.dummyProducts.firstWhere(
      (p) => p.id == productId,
      orElse: () => ProductListScreen.dummyProducts[0],
    );

    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                product.imageUrl,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              product.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              product.price,
              style: const TextStyle(fontSize: 20, color: Colors.green),
            ),
            const SizedBox(height: 20),
            const Text(
              'Description:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'This is a dummy product description. In a real app, this would contain detailed information about the product features, specifications, and benefits.',
              style: TextStyle(fontSize: 16),
            ),
            const Spacer(),
            CustomButton(
              text: 'Add to Cart',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${product.name} added to cart!')),
                );
                context.go('/cart');
              },
            ),
          ],
        ),
      ),
    );
  }
}
