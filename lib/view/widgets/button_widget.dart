import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonName;
  VoidCallback onPressed;
  ButtonWidget({super.key, required this.onPressed, required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.amber[400],
      onPressed: onPressed,
      child: Text(buttonName),
    );
  }
}
