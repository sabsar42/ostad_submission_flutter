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
        toolbarHeight: 75,
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.account_circle_rounded,
              color: Colors.green,
              size: 85,
            ),
            Text(
              'John Doe',
              style: TextStyle(
                color: Colors.green,
                fontSize: 40,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Flutter Batch 4',
                  style: TextStyle(color: Colors.lightBlue, fontSize: 30),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
