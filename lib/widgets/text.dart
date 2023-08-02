import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String title;
  final double size;
  final Color textColor;
  final FontStyle style;

  const TextWidget({
    Key? key,
    required this.title,
    required this.size,
    required this.textColor,
    required this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: TextStyle(
            fontFamily: 'Iceberg',
            fontSize: size,
            fontWeight: FontWeight.w500,
            color: textColor,
            letterSpacing: 2,
            fontStyle: style));
  }
}
