import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../widget/photo_item.dart';

class PhotoListScreen extends StatefulWidget {
  const PhotoListScreen({super.key});

  @override
  State<PhotoListScreen> createState() => _PhotoListScreenState();
}

class _PhotoListScreenState extends State<PhotoListScreen> {
  List<Product> productList = [];

  @override
  void initState() {
    getProductList();
    super.initState();
  }

  void getProductList() async {
    //productList.clear();
    setState(() {});

    Response response = await get(
      Uri.parse('https://jsonplaceholder.typicode.com/photos'),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      for (var productData in data) {

        String id = productData['id'].toString();
        String title = productData['title'];
        String thumbnailUrl = productData['thumbnailUrl'];

        Product product = Product(title, thumbnailUrl, id);
        productList.add(product);
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery App'),
      ),
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return PhotoItem(
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
