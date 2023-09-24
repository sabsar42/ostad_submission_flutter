import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          'Photo Gallery',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 30, 10),
              child: Text(
                "Welcome To My Photo Gallery!",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for photos...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 3,
                crossAxisSpacing: 1,

              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    final snackBar = SnackBar(
                      content: Text('Photo ${index} clicked!'),
                      backgroundColor: Colors.green,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Column(
                    children: [
                      Image.network(
                        'https://thecatapi.com/api/images/get?format=src&type=${index + 1}',
                        width: 100,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Photo ${index}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.fromLTRB(0, 1, 5, 10),
              children: [
                ListTile(
                  title: Text('Photo 1'),
                  subtitle: Text('Description of photo 1'),
                  leading: Container(
                    width: 100,
                    height: 100,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        'https://thecatapi.com/api/images/get?format=src&type=jpeg',
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Text('Photo 2'),
                  subtitle: Text('Description of photo 2'),
                  leading: Container(
                    width: 100,
                    height: 100,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        'http://thecatapi.com/api/images/get?format=src&type=jpg',
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Text('Photo 3'),
                  subtitle: Text('Description of photo 3'),
                  leading: Container(
                    width: 100,
                    height: 100,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        'http://thecatapi.com/api/images/get?format=src&type=img',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 150),
                child: ElevatedButton(

                  onPressed: () {
                    final snackBar = SnackBar(
                      content: Text('Photos Uploaded Successfully!'),
                      backgroundColor: Colors.orange,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
               

                  child: Icon(Icons.upload,
                      size: 35), // Use a valid Flutter icon here
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
