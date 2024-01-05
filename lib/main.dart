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
    return GridView.builder(
      // shrinkWrap: true,
      //physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
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
    );
  }

  Widget _buildPortraitLayout() {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
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
        );
      },
    );
  }
}
