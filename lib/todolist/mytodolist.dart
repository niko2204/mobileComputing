import 'package:flutter/material.dart';
import 'package:async/async.dart';

void main() {
  runApp(ToDoList());
}

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {

  final _todoController = TextEditingController();
  final List<String> _todoList = [];

  void _addTodo() {
    setState(() {
      _todoList.add(_todoController.text);
      _todoController.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ToDoList'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: _todoController,
                decoration: InputDecoration(
                  hintText: 'Enter a to-do',
                ),
              ),
            ),
            ElevatedButton(
              child: Text('Add'),
              onPressed: _addTodo,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _todoList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_todoList[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}