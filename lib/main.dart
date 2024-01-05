import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        color: Colors.orange,
        debugShowCheckedModeBanner: true,
        home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.green,
        elevation: 70,
        centerTitle: true,
        title: Text(
          'Home',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        leading: Icon(
          Icons.add_business,
          color: Colors.white,
          size: 28,
        ),
        actions: [
          Container(   // used container widget to align the Search icon
            margin: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.search,
              color: Colors.white,
              size: 28,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'This is mod 5 assignment',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'My',
                  style: TextStyle(color: Colors.redAccent, fontSize: 25),
                ),
                SizedBox(width: 5),
                Text(
                  'Phone',
                  style: TextStyle(color: Colors.blueAccent, fontSize: 15),
                ),
                SizedBox(width: 5),
                Text(
                  'name',
                  style: TextStyle(color: Colors.purpleAccent, fontSize: 20),
                ),
                SizedBox(width: 5),
                Text(
                  'Your Phone Name',
                  style: TextStyle(
                    color: Colors.orangeAccent,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
