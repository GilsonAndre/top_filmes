import 'package:flutter/material.dart';

//Widget para modificar o texto sempre que precisar de um jeito especifico
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
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        text,
        style: TextStyle(
          fontSize: size,
          color: color,
        ),
      ),
    );
  }
}
