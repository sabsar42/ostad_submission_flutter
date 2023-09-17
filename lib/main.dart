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
        toolbarHeight: 70,
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          'Photo Gallery',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      body: Scrollbar(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.fromLTRB(1, 20, 20, 10),
            child: Text(
              "Welcome To My Photo Gallery!",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
                decoration: InputDecoration(
                    hintText: 'Search for Photos',
                    border: OutlineInputBorder())),
          ),
          Expanded(
            child: GridView(
              padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.9),
              children: [
                Image.network('http://thecatapi.com/api/images/get?format=src'),
                Image.network('http://thecatapi.com/api/images/get?format=src'),
                Image.network('http://thecatapi.com/api/images/get?format=src'),
                Image.network('http://thecatapi.com/api/images/get?format=src'),
                Image.network('http://thecatapi.com/api/images/get?format=src'),
                Image.network('http://thecatapi.com/api/images/get?format=src'),
                Image.network('http://thecatapi.com/api/images/get?format=src'),
                Image.network('http://thecatapi.com/api/images/get?format=src'),
                Image.network('http://thecatapi.com/api/images/get?format=src')
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
              children: [
                ListTile(
                  title: Text('Photo 1'),
                  subtitle: Text('Photo 1'),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'http://thecatapi.com/api/images/get?format=src'),
                  ),
                ),
                ListTile(
                  title: Text('Photo 1'),
                  subtitle: Text('Photo 1'),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'http://thecatapi.com/api/images/get?format=src'),
                  ),
                ),
                ListTile(
                  title: Text('Photo 1'),
                  subtitle: Text('Photo 1'),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'http://thecatapi.com/api/images/get?format=src'),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
