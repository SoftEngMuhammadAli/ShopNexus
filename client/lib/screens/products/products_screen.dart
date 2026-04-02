import 'package:flutter/material.dart';
import 'package:shop_nexus/data/products.dart';
import 'package:shop_nexus/widgets/button.dart';
import 'package:shop_nexus/widgets/text_field.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ProductsScreen')),
      body: Center(
        child: Column(
          children: [
            CustomTextField(
              labelText: "Search...",
              hintText: "Enter product to search...",
            ),

            ...products
                .map((product) => Text(product['name'].toString()))
                .toList(),

            CustomButton(label: "Add Product", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
