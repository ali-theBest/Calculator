import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color? buttonColor;
  final String buttonText;
  final Color? textColor;
  final void Function()? tapped;

  
  const Button({
    Key? key,
    required this.buttonColor,
    required this.buttonText,
    required this.textColor,
    required this.tapped,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ElevatedButton(
        onPressed: tapped,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: const CircleBorder(),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 32,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
