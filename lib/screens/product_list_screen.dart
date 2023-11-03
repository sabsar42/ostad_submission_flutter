import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../widegt/product_item.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> productList = [];
  bool inProgress = false;

  @override
  void initState()
  {
    getProductList();
    super.initState();
  }

  void getProductList() async {
    inProgress = true;
    setState(() {});

    Response response = await get(
      Uri.parse('https://jsonplaceholder.typicode.com/photos'),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      for (var productData in data) {
        String title = productData['title'];
        String thumbnailUrl = productData['thumbnailUrl'];
        String id = productData['id'];
        Product product = Product(title, thumbnailUrl,id);
        productList.add(product);
      }
    }

    inProgress = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product list'),
      ),
      body: inProgress
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: productList.length,

              itemBuilder: (context, index) {
                return ProductItem(
                  product: productList[index],
                );
              },
            ),
    );
  }
}

class Product {
  final String title;
  final String thumbnailUrl;
  final String id;

  Product(
    this.title,
    this.thumbnailUrl,
      this.id,
  );
}
