import 'package:flutter/material.dart';
import 'package:todo_nest/Components/dialog_box.dart';
import 'package:todo_nest/Components/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Text Controller
  final _controller = TextEditingController();
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

  // Save New Task Method
  void saveNewTask() {
    setState(() {
      toDoTask.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  // Create New Task Method
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            myController: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  // Delete Task method
  void deleteMyTask(int index) {
    setState(() {
      toDoTask.removeAt(index);
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

      // Floating Button to add tasks
      floatingActionButton: FloatingActionButton(
          onPressed: createNewTask, child: const Icon(Icons.add)),

      body: ListView.builder(
        itemCount: toDoTask.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: toDoTask[index][0],
            isTaskCompleted: toDoTask[index][1],
            onChanged: (value) => checkedBox(value, index),
            deleteTask: (context) => {deleteMyTask(index)},
          );
        },
      ),
    );
  }
}
