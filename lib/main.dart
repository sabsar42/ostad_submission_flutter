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
        title: Text('Orientation Demo'),
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

  Widget _buildPortraitLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage(
              'https://media.istockphoto.com/id/186985453/photo/old-folding-camera.webp?s=170667a&w=0&k=20&c=E87gjPz6vFNEpvxWJ_lWRycPPc8qaR_5WD-DzPEcH4E=',
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
                // Handle onTap action
              },
              child: Column(
                children: [
                  Image.network(
                    'https://media.istockphoto.com/id/186985453/photo/old-folding-camera.webp?s=170667a&w=0&k=20&c=E87gjPz6vFNEpvxWJ_lWRycPPc8qaR_5WD-DzPEcH4E=',
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
      ],
    );
  }

  Widget _buildLandscapeLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage(
              'https://media.istockphoto.com/id/186985453/photo/old-folding-camera.webp?s=170667a&w=0&k=20&c=E87gjPz6vFNEpvxWJ_lWRycPPc8qaR_5WD-DzPEcH4E=',
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
                // Handle onTap action
              },
              child: Column(
                children: [
                  Image.network(
                    'https://media.istockphoto.com/id/186985453/photo/old-folding-camera.webp?s=170667a&w=0&k=20&c=E87gjPz6vFNEpvxWJ_lWRycPPc8qaR_5WD-DzPEcH4E=',
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
      ],
    );
  }
}
