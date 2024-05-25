import 'package:flutter/material.dart';

class SaveOrCancelButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

  SaveOrCancelButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.yellow[600],
      child: Text(text),
    );
  }
}
