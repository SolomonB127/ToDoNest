import 'package:flutter/material.dart';
import 'package:todo_nest/Components/buttons.dart';

class DialogBox extends StatelessWidget {
  // Text filed controller
  // ignore: prefer_typing_uninitialized_variables
  final myController;

  // Methods for save & cancel buttons
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogBox(
      {super.key,
      required this.myController,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blueGrey,
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // Text field to input new task
            TextField(
              controller: myController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add a new task"),
            ),

            // Buttons -> save and cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButtons(btnText: "Save", onPressed: onSave),
                const SizedBox(
                  width: 5,
                ),
                MyButtons(btnText: "Cancel", onPressed: onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
