import 'package:flutter/material.dart';
import 'package:shop_nexus/services/api_services.dart';
import 'package:shop_nexus/widgets/product_card.dart';
import 'package:shop_nexus/widgets/search.dart';
import 'package:shop_nexus/screens/products/details_screen.dart';
import 'package:shop_nexus/theme/app_theme.dart';

class AdminProductsScreen extends StatelessWidget {
  final ApiServices apiServices = ApiServices();

  AdminProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Products Management'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
            tooltip: 'Add product',
          ),
        ],
      ),
      body: Column(
        children: [
          const CustomSearchBar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: FutureBuilder<List<dynamic>>(
                future: apiServices.fetchProducts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Unable to load products',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    );
                  }
                  final products = snapshot.data ?? [];
                  return GridView.builder(
                    itemCount: products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.72,
                        ),
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ProductCard(
                        title: product['title'],
                        description: product['description'],
                        price: product['price']?.toDouble(),
                        imageUrl: product['thumbnail'],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ProductsDetailScreen(
                                title: product['title'],
                                description: product['description'],
                                price: product['price']?.toDouble() ?? 0,
                                imageUrl: product['thumbnail'],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
