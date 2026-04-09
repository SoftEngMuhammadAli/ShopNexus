import 'package:flutter/material.dart';
import 'package:shop_nexus/screens/products/details_screen.dart';
import 'package:shop_nexus/services/api_services.dart';
import 'package:shop_nexus/theme/app_theme.dart';
import 'package:shop_nexus/widgets/product_card.dart';
import 'package:shop_nexus/widgets/search.dart';

class ProductsScreen extends StatelessWidget {
  final ApiServices apiServices = ApiServices();

  ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(title: const Text('Products'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        child: Column(
          children: [
            CustomSearchBar(onSearch: (value) {}),
            const SizedBox(height: 18),
            Expanded(
              child: FutureBuilder<List<dynamic>>(
                future: apiServices.fetchProducts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Unable to fetch products',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    );
                  }
                  final products = snapshot.data ?? [];
                  if (products.isEmpty) {
                    return Center(
                      child: Text(
                        'No products yet',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    );
                  }
                  return GridView.builder(
                    itemCount: products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 0.70,
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
          ],
        ),
      ),
    );
  }
}
