import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Product {
  final String id;
  final String name;
  final String price;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
  });
}

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  static final List<Product> dummyProducts = [
    Product(
      id: '1',
      name: 'Wireless Headphones',
      price: '\$99.99',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Product(
      id: '2',
      name: 'Smart Watch',
      price: '\$199.99',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Product(
      id: '3',
      name: 'Laptop',
      price: '\$999.99',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Product(
      id: '4',
      name: 'Phone Case',
      price: '\$19.99',
      imageUrl: 'https://via.placeholder.com/150',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: ListView.builder(
        itemCount: dummyProducts.length,
        itemBuilder: (context, index) {
          final product = dummyProducts[index];
          return ListTile(
            leading: Image.network(
              product.imageUrl,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(product.name),
            subtitle: Text(product.price),
            onTap: () => context.go('/product/${product.id}'),
          );
        },
      ),
    );
  }
}
