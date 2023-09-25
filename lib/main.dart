import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    Item('Product 2', '15.00', 0)
  ];

  var totalProduct = 0;

  void checkCounterIncrease() {
    for (int i = 0; i < items.length; i++) {
      if (items[i].counter > 0) {
        totalProduct++;
      }
    }
  }

  void _showAlertDialog(int totalCounter, int itemIndex) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Congratulations'),
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(items[index].productName),
                  subtitle: Text('Price: ${items[index].productPrice}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        children: [
                          Text('Count: ${items[index].counter.toString()}'),
                          // SizedBox(height: 3),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                items[index].counter++;
                                // int totalCounter = items.fold(0, (sum, item) => sum + item.counter);
                                if (items[index].counter >= 5) {
                                  _showAlertDialog(items[index].counter, index);
                                }
                              });
                            },
                            child: Row(
                              children: [
                                Text('Buy Now'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          checkCounterIncrease();
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CartScreen(productCount: totalProduct);
            totalProduct=0;
          }));
          totalProduct=0;
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
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (context) => CounterScreen(),
              ),
            );
          },
          icon: Icon(Icons.arrow_back_outlined),
        ),
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
