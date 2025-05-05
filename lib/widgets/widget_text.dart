import 'package:flutter/material.dart';

class WidgetText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight weight;

  const WidgetText({
    super.key,
    required this.text,
    required this.color,
    required this.size,
    required this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
      ),
    );
  }
}
