import 'package:expence_tracker/data/data.dart';
import 'package:expence_tracker/screens/home/widgets/card_text.dart';
import 'package:expence_tracker/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 86 * transactionList.length.toDouble(),
      child: ListView.separated(
        itemBuilder: (context, index) => DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: transactionList[index]['color'],
                        shape: BoxShape.circle,
                      ),
                    ),
                    transactionList[index]['icon'],
                  ],
                ),
                const Gap(8.0),
                Expanded(
                  child: AppText(
                    text: transactionList[index]['name'],
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                CardText(
                  isTotalPrice: false,
                  headingText: '${transactionList[index]['totalAmt']}\n',
                  priceText: transactionList[index]['date'],
                  headingTextColor: Theme.of(context).colorScheme.onBackground,
                  priceTextColor: Theme.of(context).colorScheme.outline,
                  headingFontSize: 14.0,
                  priceTextFontSize: 12.0,
                  textAlign: TextAlign.end,
                ),
              ],
            ),
          ),
        ),
        separatorBuilder: (context, index) => const Gap(10.0),
        itemCount: transactionList.length,
      ),
    );
  }
}
