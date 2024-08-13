import 'package:flutter/material.dart';
import 'package:todo_nest/Components/todo_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Center(child: Text("To Do")),
        elevation: 0,
      ),
      body: ListView(
        children: const [
          TodoTile(),
        ],
      ),
    );
  }
}
