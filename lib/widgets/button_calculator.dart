import 'package:flutter/material.dart';

class ButtonCalculator extends StatelessWidget {
  final String text;
  final int flex;
  final Color bgColor;
  final Color fgColor;
  final VoidCallback? onPressed;

  const ButtonCalculator({
    super.key,
    required this.text,
    this.flex = 1,
    this.bgColor = const Color.fromARGB(180, 53, 52, 52),
    this.fgColor = const Color.fromARGB(255, 255, 255, 255),
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: bgColor,
            foregroundColor: fgColor,
            shape: CircleBorder(), //
            padding: EdgeInsets.all(30),
            minimumSize: Size(60, 60),
          ),
          onPressed: onPressed,
          child: Text(
            text, 
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}