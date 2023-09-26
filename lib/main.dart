import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CounterState();
}

class Item {
  String productName;
  String productPrice;
  int counter = 0;

  Item(this.productName, this.productPrice, this.counter);
}

class _CounterState extends State<CounterScreen> {
  List<Item> items = [
    Item('Product 1', '10.00', 0),
    Item('Product 2', '15.00', 0),
    Item('Product 3', '20.00', 0),
    Item('Product 4', '25.00', 0),
    Item('Product 5', '30.00', 0),
    Item('Product 6', '35.00', 0),
    Item('Product 7', '40.00', 0),
    Item('Product 8', '45.00', 0),
    Item('Product 9', '50.00', 0),
    Item('Product 10', '55.00', 0),
    Item('Product 11', '60.00', 0),
    Item('Product 12', '65.00', 0),
    Item('Product 13', '70.00', 0),
    Item('Product 14', '75.00', 0),
    Item('Product 15', '80.00', 0),
    Item('Product 16', '85.00', 0),
    Item('Product 17', '90.00', 0),
    Item('Product 18', '95.00', 0),
    Item('Product 19', '100.00', 0),
    Item('Product 20', '105.00', 0),
    Item('Product 21', '110.00', 0),
    Item('Product 22', '115.00', 0),
    Item('Product 23', '120.00', 0),
    Item('Product 24', '125.00', 0),
    Item('Product 25', '130.00', 0),
    Item('Product 26', '135.00', 0),
    Item('Product 27', '140.00', 0),
    Item('Product 28', '145.00', 0),
    Item('Product 29', '150.00', 0),
    Item('Product 30', '155.00', 0),
  ];

  Set<String> totalProductCounter = {};

  void _showAlertDialog(int totalCounter, int itemIndex) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Congratulations !'),
          content: Text(
              'You brought ${items[itemIndex].counter} product of  ${items[itemIndex].productName} '),
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(items[index].productName),
                  subtitle: Text('${items[index].productPrice}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        children: [
                          Text('Count: ${items[index].counter.toString()}'),
                          SizedBox(
                            height: 29,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  items[index].counter++;
                                  totalProductCounter
                                      .add(items[index].productName);
                                  if (items[index].counter >= 5) {
                                    _showAlertDialog(
                                        items[index].counter, index);
                                  }
                                });
                              },
                              child: Row(
                                children: [
                                  Text('Buy Now'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CartScreen(productCount: totalProductCounter.length);
          }));
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  final int productCount;

  const CartScreen({super.key, required this.productCount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Total Products :   $productCount ',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
