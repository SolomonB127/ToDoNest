import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
            color: Colors.blueAccent, borderRadius: BorderRadius.circular(12)),
        child: const Row(
          children: [

            // Checkbox
            Checkbox(value: , onChanged: ),

            // Task
            Text(
              "Make First App",
            ),
          ],
        ),
      ),
    );
  }
}
