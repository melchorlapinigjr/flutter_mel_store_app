import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Color? color;
  final VoidCallback onPressed;

  const MyButton(
      {super.key, required this.title, required this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(title),
      ),
    );
  }
}
