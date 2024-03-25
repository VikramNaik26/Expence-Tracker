import 'dart:math';

import 'package:expence_tracker/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
          child: Column(
            children: [
              Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.yellow.shade700,
                        ),
                      ),
                      Icon(
                        Icons.person,
                        color: Colors.yellow.shade900,
                      ),
                    ],
                  ),
                  const Gap(8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: 'Welcome!',
                          textColor: Theme.of(context).colorScheme.outline,
                          fontWeight: FontWeight.w600,
                        ),
                        AppText(
                          text: 'Vikram Naik',
                          textColor: Theme.of(context).colorScheme.onBackground,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.settings,
                    ),
                  ),
                ],
              ),
              const Gap(20.0),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.secondary,
                      Theme.of(context).colorScheme.tertiary,
                    ],
                    transform: const GradientRotation(pi / 4),
                  ),
                  borderRadius: BorderRadius.circular(24.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade600,
                      blurRadius: 2,
                      offset: const Offset(3, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const _CardText(
                      isTotalPrice: true,
                    ),
                    Gap(MediaQuery.of(context).size.width < 420 ? 20.0 : 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6.0),
                              decoration: const BoxDecoration(
                                color: Colors.white30,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.arrow_upward,
                                size: 12,
                                color: Colors.greenAccent,
                              ),
                            ),
                            const Gap(8.0),
                            const _CardText(
                              isTotalPrice: false,
                              headingText: 'Income\n',
                              headingFontSize: 14.0,
                              headingFontWeight: FontWeight.w400,
                              priceText: '₹ 2000.00',
                              priceTextFontSize: 14.0,
                              priceTextFontWeight: FontWeight.w600,
                              lineHeight: 1.4,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6.0),
                              decoration: const BoxDecoration(
                                color: Colors.white30,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.arrow_downward,
                                size: 12,
                                color: Colors.red,
                              ),
                            ),
                            const Gap(8.0),
                            const _CardText(
                              isTotalPrice: false,
                              headingText: 'Expenses\n',
                              headingFontSize: 14.0,
                              headingFontWeight: FontWeight.w400,
                              priceText: '₹ 800.00',
                              priceTextFontSize: 14.0,
                              priceTextFontWeight: FontWeight.w600,
                              lineHeight: 1.4,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _CardText extends StatelessWidget {
  const _CardText({
    required this.isTotalPrice,
    this.headingText,
    this.priceText,
    this.headingFontSize,
    this.headingFontWeight,
    this.priceTextFontSize,
    this.priceTextFontWeight,
    this.lineHeight,
  });

  final String? headingText;
  final String? priceText;
  final double? headingFontSize;
  final double? priceTextFontSize;
  final FontWeight? headingFontWeight;
  final FontWeight? priceTextFontWeight;
  final double? lineHeight;
  final bool isTotalPrice;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: headingText ?? 'Total Balance\n',
        style: TextStyle(
          fontSize: headingFontSize ?? 16.0,
          color: Colors.white,
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
            ),
          ),
        ],
      ),
    );
  }
}
