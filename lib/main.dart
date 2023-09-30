import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Feed'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              if (orientation == Orientation.portrait) {
                return _buildPortraitLayout();
              } else {
                return _buildLandscapeLayout();
              }
            },
          );
        },
      ),
    );
  }

  Widget _buildLandscapeLayout() {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: CircleAvatar(
            radius: 200,
            backgroundImage: NetworkImage(
              'https://media.istockphoto.com/id/186985453/photo/old-folding-camera.webp?s=170667a&w=0&k=20&c=E87gjPz6vFNEpvxWJ_lWRycPPc8qaR_5WD-DzPEcH4E=',
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Jhone Doe',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'In the heart of a bustling city, life moves at an exhilarating pace.'
                'In the heart of a bustling city, life moves at an exhilarating pace.'
                'In the heart of a bustling city, life moves at an exhilarating pace.',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 8),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 3,
                    crossAxisSpacing: 1,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Image.network(
                        'https://images.unsplash.com/photo-1555652736-e92021d28a10?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80',
                        width: 150,
                        height: 150,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPortraitLayout() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: CircleAvatar(
            radius: 200,
            backgroundImage: NetworkImage(
              'https://media.istockphoto.com/id/186985453/photo/old-folding-camera.webp?s=170667a&w=0&k=20&c=E87gjPz6vFNEpvxWJ_lWRycPPc8qaR_5WD-DzPEcH4E=',
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Jhone Doe',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'In the heart of a bustling city, life moves at an exhilarating pace.'
                'In the heart of a bustling city, life moves at an exhilarating pace.'
                'In the heart of a bustling city, life moves at an exhilarating pace.',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 8),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 3,
                    crossAxisSpacing: 1,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Image.network(
                        'https://images.unsplash.com/photo-1555652736-e92021d28a10?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80',
                        width: 150,
                        height: 150,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
