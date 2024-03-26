import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText({
    super.key,
    required this.text,
    this.textColor,
    this.fontSize,
    this.fontWeight,
  });

  final String text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor ?? Theme.of(context).colorScheme.onBackground,
        fontSize: fontSize ?? 12,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontFamily: 'Poppins',
      ),
    );
  }
}
