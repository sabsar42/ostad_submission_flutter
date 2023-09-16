import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          'My Shopping List',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.shopping_cart,
              color: Colors.white,
              size: 28,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Apples'),
            leading: Icon(Icons.shopping_basket),
          ),
          ListTile(
            title: Text('Bananas'),
            leading: Icon(Icons.shopping_basket),
          ),
          ListTile(
            title: Text('Bread'),
            leading: Icon(Icons.shopping_basket),
          ),
          ListTile(
            title: Text('Milk'),
            leading: Icon(Icons.shopping_basket),
          ),
          ListTile(
            title: Text('Eggs'),
            leading: Icon(Icons.shopping_basket),
          ),
        ],
      ),
    );
  }
}
