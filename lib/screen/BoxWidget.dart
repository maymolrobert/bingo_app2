
import 'package:flutter/material.dart';

import '../Strings/strings.dart';

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
          color: Strings.primaries[index],
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

}

