import 'package:flutter/material.dart';
import 'package:todo_nest/Components/buttons.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

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
            const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add a new task"),
            ),

            // Buttons -> save and cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButtons(btnText: "Save", onPressed: () {}),
                const SizedBox(
                  width: 5,
                ),
                MyButtons(btnText: "Cancel", onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
