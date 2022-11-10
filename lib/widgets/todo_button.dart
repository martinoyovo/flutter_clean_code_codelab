import 'package:flutter/material.dart';


class TodoButton extends StatelessWidget {
  final VoidCallback onButtonPressed;
  final String actionName;
  const TodoButton({Key? key, required this.onButtonPressed, required this.actionName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onButtonPressed,
      child: Text(actionName),
    );
  }
}
