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
  List<Photo> photoList = [];

  @override
  void initState() {
    getphotoList();
    super.initState();
  }

  void getphotoList() async {
    //photoList.clear();
    setState(() {});

    Response response = await get(
      Uri.parse('https://jsonplaceholder.typicode.com/photos'),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      for (var photoData in data) {
        String id = photoData['id'].toString();
        String title = photoData['title'];
        String thumbnailUrl = photoData['thumbnailUrl'];

        Photo photo = Photo(title, thumbnailUrl, id);
        photoList.add(photo);
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
        itemCount: photoList.length,
        itemBuilder: (context, index) {
          return PhotoItem(
            photo: photoList[index],
          );
        },
      ),
    );
  }
}

class Photo {
  final String title;
  final String thumbnailUrl;
  final String id;

  Photo(
    this.title,
    this.thumbnailUrl,
    this.id,
  );
}
