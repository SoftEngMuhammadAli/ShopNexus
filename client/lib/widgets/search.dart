import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final void Function(String)? onSearch;

  const CustomSearchBar({super.key, this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextFormField(
        onFieldSubmitted: onSearch,
        decoration: InputDecoration(
          hintText: 'Search products, brands, categories...',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
            icon: const Icon(Icons.tune),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
