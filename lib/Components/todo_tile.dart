import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  // Tile Variables
  final String taskName;
  final bool isTaskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteTask;

  const TodoTile(
      {super.key,
      required this.taskName,
      required this.isTaskCompleted,
      required this.onChanged,
      required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
      child: Slidable(
        endActionPane:
            ActionPane(motion: const ScrollMotion(), children: <Widget>[
          SlidableAction(
            onPressed: deleteTask,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(13),
          )
        ]),
        child: Container(
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              // Checkbox
              Checkbox(
                value: isTaskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),

              // Task
              Text(
                taskName,
                style: TextStyle(
                    decoration: isTaskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
