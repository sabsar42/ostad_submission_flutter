import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class ToDo {
  String title;
  String description;

  ToDo(this.title, this.description);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ToDoListScreen(),
    );
  }
}

class ToDoListScreen extends StatefulWidget {
  @override
  _ToDoListScreenState createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  List<ToDo> toDoList = [];
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController editTitleController = TextEditingController();
  final TextEditingController editDescriptionController =
      TextEditingController();

  void _addTask() {
    String title = titleController.text;
    String description = descriptionController.text;

    if (title.isNotEmpty && description.isNotEmpty) {
      setState(() {
        toDoList.add(ToDo(title, description));
        titleController.clear();
        descriptionController.clear();
      });
    }
  }

  void _deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  void _editTask(BuildContext context, int index) {
    ToDo selectedTask = toDoList[index];
    titleController.text = selectedTask.title;
    descriptionController.text = selectedTask.description;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(5),
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(
                      labelText: 'Title',
                      hintText: "Add Title",
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                    maxLines: null,
                    // overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                      labelText: 'Description',
                      hintText: "Add Description",
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                    maxLines: null,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedTask.title = titleController.text;
                      selectedTask.description = descriptionController.text;
                      Navigator.of(context).pop();
                    });
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        EdgeInsets.fromLTRB(30, 10, 30, 10)),
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  child: Text('Edit Done'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Container(
            padding: EdgeInsets.all(10),
            child: Icon(
              size: 30.0,
              Icons.search,
              color: Colors.blue,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(2),
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: ' Title',
                hintText: "Add Title",
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
              maxLines: null,
            ),
          ),
          Container(
            margin: EdgeInsets.all(2),
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: ' Description',
                hintText: 'Add Description',
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
              maxLines: null,
            ),
          ),
          ElevatedButton(
            onPressed: _addTask,
            child: Text(
              'ADD',
              style: TextStyle(fontSize: 16.0),
            ),
            style: ElevatedButton.styleFrom(
              elevation: 5.0,
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              backgroundColor: Colors.red,
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.separated(
              itemCount: toDoList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.red,
                  ),
                  title: Text(toDoList[index].title),
                  subtitle: Text(toDoList[index].description),
                  trailing: Icon(Icons.arrow_forward),
                  tileColor: Colors.grey[300],
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Alert"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                _editTask(context, index);
                              },
                              child: Text("Edit"),
                            ),
                            TextButton(
                              onPressed: () {
                                _deleteTask(index);
                                Navigator.of(context).pop();
                              },
                              child: Text("Delete"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  height: 3.0,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
