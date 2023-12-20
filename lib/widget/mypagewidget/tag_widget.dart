import 'package:flutter/material.dart';

class TagWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color borderColor;
  final TextStyle textStyle;

  const TagWidget({
    super.key,
    required this.text,
    required this.onTap,
    this.borderColor = Colors.blue,
    this.textStyle = const TextStyle(color: Colors.black),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(color: borderColor, width: 0.5),
          ),
          child: Text(
            '# $text',
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
