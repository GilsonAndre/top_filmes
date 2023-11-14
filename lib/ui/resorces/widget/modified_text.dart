import 'package:flutter/material.dart';

class ModifiedText extends StatelessWidget {
  const ModifiedText({
    required this.text,
    required this.size,
    required this.color,
    super.key,
  });
  final String text;
  final double size;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
      ),
    );
  }
}
