import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_nexus/features/cart/presentation/providers/cart_provider.dart';
import 'package:shop_nexus/shared/widgets/custom_button.dart';

class CartItem {
  final String id;
  final String name;
  final String price;
  final int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    this.quantity = 1,
  });

  double get totalPrice => double.parse(price.substring(1)) * quantity;
}

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);

    final total = cartItems.fold<double>(
      0,
      (sum, item) => sum + item.totalPrice,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: cartItems.isEmpty
          ? const Center(child: Text('Your cart is empty'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text('${item.price} x ${item.quantity}'),
                        trailing: Text(
                          '\$${item.totalPrice.toStringAsFixed(2)}',
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$${total.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      CustomButton(
                        text: 'Checkout',
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Checkout not implemented yet'),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
