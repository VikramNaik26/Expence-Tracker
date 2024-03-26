import 'package:flutter/material.dart';

class CardText extends StatelessWidget {
  const CardText({
    required this.isTotalPrice,
    this.headingText,
    this.priceText,
    this.headingFontSize,
    this.headingFontWeight,
    this.priceTextFontSize,
    this.priceTextFontWeight,
    this.lineHeight,
    this.headingTextColor,
    this.priceTextColor,
    this.textAlign,
  });

  final String? headingText;
  final String? priceText;
  final double? headingFontSize;
  final Color? headingTextColor;
  final double? priceTextFontSize;
  final FontWeight? headingFontWeight;
  final FontWeight? priceTextFontWeight;
  final Color? priceTextColor;
  final double? lineHeight;
  final bool isTotalPrice;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign ?? TextAlign.center,
      text: TextSpan(
        text: headingText ?? 'Total Balance\n',
        style: TextStyle(
          fontSize: headingFontSize ?? 16.0,
          color: headingTextColor ?? Colors.white,
          fontWeight: headingFontWeight ?? FontWeight.w600,
          height: lineHeight ?? 1.6,
        ),
        children: [
          TextSpan(
            text: priceText ?? '₹ 4000.00',
            style: TextStyle(
              fontSize: isTotalPrice
                  ? MediaQuery.of(context).size.width < 460
                      ? priceTextFontSize ?? 30.0
                      : 36.0
                  : priceTextFontSize,
              fontWeight: priceTextFontWeight ?? FontWeight.bold,
              letterSpacing: isTotalPrice ? 4 : 2,
              color: priceTextColor ?? Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}