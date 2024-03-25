import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String buttonText;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? buttonTapped;

  const CalculatorButton({
    Key? key,
    this.buttonTapped,
    this.backgroundColor,
    this.color,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            color: backgroundColor,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  color: color,
                  fontSize: 25,
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
