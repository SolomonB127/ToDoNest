import 'package:flutter/material.dart';
import 'package:todo_nest/Components/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //list task
  List toDoTask = [
    ["Make First App", false],
    ["Eat", false],
  ];

  // On changes method
  void checkedBox(bool? value, int index) {
    setState(() {
      toDoTask[index][1] = !toDoTask[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Center(child: Text("To Do")),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: toDoTask.length,
        itemBuilder: (context, index) {
          return TodoTile(
              taskName: toDoTask[index][0],
              isTaskCompleted: toDoTask[index][1],
              onChanged: (value) => checkedBox(value, index));
        },
      ),
    );
  }
}
