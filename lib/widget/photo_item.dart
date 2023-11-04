import 'package:flutter/material.dart';
import '../screens/photo_detail_screen.dart';
import '../screens/photo_list_screen.dart';

class PhotoItem extends StatelessWidget {
  const PhotoItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8), // Adjust the padding as needed
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PhotoDetailScreen(product: product),
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
