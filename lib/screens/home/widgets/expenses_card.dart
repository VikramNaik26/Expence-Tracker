import 'dart:math';

import 'package:expence_tracker/screens/home/widgets/card_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ExpensesCard extends StatelessWidget {
  const ExpensesCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          const CardText(
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
                  const CardText(
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
                  const CardText(
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
    );
  }
}
