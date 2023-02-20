import 'dart:ffi';

import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Color textColor;
  final String buttonText;
  final Function() buttonTapped;
  final int index;

  const ButtonWidget(
      {super.key,
        required this.textColor,
        required this.buttonText,
        required this.buttonTapped, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: primaries[index],
        ),
        child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  color: textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  static const List<MaterialColor> primaries =[
    Colors.red,
    Colors.lightGreen,
    Colors.purple,
    Colors.deepPurple,
    Colors.indigo,
    Colors.blue,
    Colors.lightBlue,
    Colors.cyan,
    Colors.teal,
    Colors.green,
    Colors.lightGreen,
    Colors.lime,
    Colors.yellow,
    Colors.amber,
    Colors.orange,
    Colors.deepOrange,
    Colors.brown,
    // The grey swatch is intentionally omitted because when picking a color
    // randomly from this list to colorize an application, picking grey suddenly
    // makes the app look disabled.
    Colors.blueGrey,
    Colors.lime,
    Colors.lightGreen,
    Colors.lightBlue,
    Colors.cyan,
    Colors.teal,
    Colors.green,
    Colors.lightGreen,
    Colors.lime,
    Colors.yellow,
    Colors.amber,

  ];
}

