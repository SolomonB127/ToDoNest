import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  // Buttons variables
  final String btnText;
  final VoidCallback onPressed;
  
  const MyButtons({super.key, required this.btnText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: const Color.fromARGB(255, 26, 58, 73),
      child: Text(btnText),
    );
  }
}
