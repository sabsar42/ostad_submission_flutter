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
      home: ColorChangeScreen(),
    );
  }
}

class ColorChangeScreen extends StatefulWidget {
  @override
  _ColorChangeScreenState createState() => _ColorChangeScreenState();
}

class _ColorChangeScreenState extends State<ColorChangeScreen> {
  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
  ];

  List<String> selectedItems = [];

  void Selected(bool isSelected, int index) {
    if (isSelected) {
      selectedItems.remove(items[index]);
    } else {
      selectedItems.add(items[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selection Screen '),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          bool isSelected = selectedItems.contains(items[index]);
          return ListTile(
            title: Text(items[index]),
            tileColor: isSelected ? Colors.blue : null,
            onTap: () {
              setState(() {
                Selected(isSelected, index);
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Selected Items'),
                content:
                    Text('Number of selected items: ${selectedItems.length}'),
                actions: <Widget>[
                  TextButton(
                    child: Text('Close'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
