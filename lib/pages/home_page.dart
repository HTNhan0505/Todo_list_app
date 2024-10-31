import 'package:flutter/material.dart';
import 'package:simple_todo_app/pages/todo_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _text = TextEditingController();
  bool _validate = false;

  List toDoList = [
    ['Test eyeq Tech company', false],
    ['Build to do list app', false]
  ];

  void checkBoxChanged(int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void createNewTab() {
    if(_text.text.isEmpty) {
      setState(() {
        _validate = true;
      });
    } else {
      setState(() {
        _validate = false;
        toDoList.add([_text.text, false]);
        _text.clear();
      });
    }
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade200,
      appBar: AppBar(
        title: const Text('TO DO LIST APP'),
        centerTitle: true,
        backgroundColor: Colors.amber,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (BuildContext context, index) {
            return TodoItem(
              taskName: toDoList[index][0],
              isCompleted: toDoList[index][1],
              onChanged: (value) => checkBoxChanged(index),
              handleDelete: () => deleteTask(index),
            );
          }),
      floatingActionButton: Row(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              controller: _text,
              decoration: InputDecoration(
                  hintText: 'Add your new task',
                  filled: true,
                  fillColor: Colors.white,
                  errorText: _validate ? "Value Can't Be Empty" : null,
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(15))),
            ),
          )),
          FloatingActionButton(
            onPressed: createNewTab,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
