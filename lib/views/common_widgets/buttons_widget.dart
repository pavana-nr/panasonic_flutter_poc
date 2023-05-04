import 'package:flutter/material.dart';

class ButtonsWidget extends StatelessWidget {
  final String text;
  final Color color;
  final Color backgroundColor;
  final VoidCallback onClicked;

  const ButtonsWidget({
    Key? key,
    required this.text,
    this.color = Colors.white,
    this.backgroundColor = Colors.black,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton.icon(
        icon: Icon(
          Icons.update,
          color: Colors.black,
        ),
        style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        ),
        label: Text(
          text,
          style: TextStyle(fontSize: 20, color: color),
        ),
        onPressed: onClicked,
      );
}
