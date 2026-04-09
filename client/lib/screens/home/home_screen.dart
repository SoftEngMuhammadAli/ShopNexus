import 'package:flutter/material.dart';
import 'package:shop_nexus/screens/products/details_screen.dart';
import 'package:shop_nexus/routes/routers.dart';
import 'package:shop_nexus/services/api_services.dart';
import 'package:shop_nexus/theme/app_theme.dart';
import 'package:shop_nexus/widgets/drawer.dart';
import 'package:shop_nexus/widgets/product_card.dart';
import 'package:shop_nexus/widgets/search.dart';

class HomeScreen extends StatelessWidget {
  final ApiServices apiServices = ApiServices();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      drawer: const CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Shop Nexus'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined)),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_bag_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    gradient: const LinearGradient(
                      colors: [AppTheme.primaryContainer, AppTheme.primary],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.primary.withAlpha(41),
                        blurRadius: 32,
                        offset: const Offset(0, 18),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Curating the Future of Style',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Explore premium collections, curated drops, and designer essentials in one place.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white70,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 24),
                      CustomSearchBar(onSearch: (value) {}),
                      const SizedBox(height: 22),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          _categoryChip(context, 'New Arrivals'),
                          _categoryChip(context, 'Tech'),
                          _categoryChip(context, 'Audio'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: _infoTile(
                        context: context,
                        title: 'Free shipping',
                        subtitle: 'On orders above Rs 2000',
                        icon: Icons.local_shipping,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _infoTile(
                        context: context,
                        title: 'Secure checkout',
                        subtitle: 'Encrypted payment methods',
                        icon: Icons.lock_outline,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Text(
                      'Featured Products',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.products);
                      },
                      child: const Text('View all'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              SizedBox(
                height: 300,
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
                    if (products.isEmpty) {
                      return Center(
                        child: Text(
                          'No products found',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      );
                    }

                    return ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length.clamp(0, 5),
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 16),
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
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: AppTheme.surface,
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.primary.withAlpha(20),
                        blurRadius: 24,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: AppTheme.primary.withAlpha(26),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: const Icon(
                              Icons.local_offer,
                              color: AppTheme.primary,
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Text(
                              'Nexus Seasonal Premium Sale',
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      Text(
                        'Experience premium offers on our top collections with limited-time savings.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.onSurface.withAlpha(191),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  AppRoutes.products,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppTheme.primary,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                              child: const Text('Explore Sale'),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  AppRoutes.products,
                                );
                              },
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                  color: AppTheme.primary.withAlpha(51),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                              child: Text(
                                'View Lookbook',
                                style: TextStyle(color: AppTheme.primary),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 28),
            ],
          ),
        ),
      ),
    );
  }

  Widget _categoryChip(BuildContext context, String label) {
    return Chip(
      label: Text(
        label,
        style: Theme.of(
          context,
        ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),
      ),
      backgroundColor: AppTheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
    );
  }

  Widget _infoTile({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: AppTheme.primary.withAlpha(20),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: AppTheme.primary, size: 24),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppTheme.onSurface.withAlpha(179),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
