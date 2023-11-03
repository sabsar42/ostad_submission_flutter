import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../widegt/product_item.dart';
import 'package:ostad_submission_flutter/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Photo Details'
        ),
      ),
      body:
      Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              height: double.infinity,
              child: Image.network(
                product.thumbnailUrl,
                fit: BoxFit.contain,



              ),
            ),
          ),
          // Text(product.id),
          Container(
            child: Text(product.title),
          ),
        ],
      ),
    );
  }
}
