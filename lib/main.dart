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



          GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 5.0,
            ),
            itemCount: 6,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  final snackBar = SnackBar(
                    content: Text('Image ${index + 1} clicked!'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Column(
                  children: [
                    Image.network(
                      'http://thecatapi.com/api/images/get?format=src${index + 1}',
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(height: 5),
                    Text('Caption ${index + 1}'),
                  ],
                ),
              );
            },
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

          Container(
            child: ElevatedButton(
              onPressed: () {
                final snackBar = SnackBar(
                  content: Text('Image clicked!'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Icon(Icons.favorite), // Use a valid Flutter icon here
            ),
          )




        ]

        ),
      ),
    );
  }
}
