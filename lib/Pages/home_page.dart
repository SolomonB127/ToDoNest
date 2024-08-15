import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_nest/Components/dialog_box.dart';
import 'package:todo_nest/Components/todo_tile.dart';
import 'package:todo_nest/data/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Reference the Hive Box
  final _storageBox = Hive.box('storage');
  // instance of Database Class
  ToDoDB db = ToDoDB();

  @override
  void initState() {
    // If this is first time running app, create default data
    if (_storageBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // data already exists
      db.loadData();
    }
    super.initState();
  }

  // Text Controller
  final _controller = TextEditingController();

  // On changes method
  void checkedBox(bool? value, int index) {
    setState(() {
      db.toDoTask[index][1] = !db.toDoTask[index][1];
    });
    db.updateData();
  }

  // Save New Task Method
  void saveNewTask() {
    setState(() {
      db.toDoTask.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
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
      db.toDoTask.removeAt(index);
    });
    db.updateData();
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
        itemCount: db.toDoTask.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.toDoTask[index][0],
            isTaskCompleted: db.toDoTask[index][1],
            onChanged: (value) => checkedBox(value, index),
            deleteTask: (context) => {deleteMyTask(index)},
          );
        },
      ),
    );
  }
}
