import 'package:ostad_submission_flutter/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

import '../screens/product_detailed_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  ProductDetailScreen(product: product),
            ),
          );

        },
        leading: Image.network(
          product.thumbnailUrl,
          width: 80,
        ),
        title: Text(product.title),
      ),
    );
  }
}