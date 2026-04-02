import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_nexus/features/cart/presentation/screens/cart_screen.dart';

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super(_dummyCartItems);

  static final List<CartItem> _dummyCartItems = [
    CartItem(
      id: '1',
      name: 'Wireless Headphones',
      price: '\$99.99',
      quantity: 1,
    ),
    CartItem(id: '2', name: 'Smart Watch', price: '\$199.99', quantity: 2),
  ];

  void addItem(CartItem item) {
    state = [...state, item];
  }

  void removeItem(String id) {
    state = state.where((item) => item.id != id).toList();
  }

  void clearCart() {
    state = [];
  }
}
