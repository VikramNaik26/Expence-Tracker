import 'package:expence_tracker/screens/home/widgets/card_text.dart';
import 'package:expence_tracker/widgets/app_text.dart';
import 'package:expense_repository/expense_repository.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    super.key,
    required this.expenses,
  });

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return expenses.isEmpty
        ? const SizedBox(
            height: 100,
            child: Center(
              child: AppText(
                text: 'No Transactions Found',
                fontSize: 18.0,
                textColor: Colors.grey,
              ),
            ),
          )
        : SizedBox(
            height: 86 * expenses.length.toDouble(),
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
                              color: Color(expenses[index].category.color),
                              shape: BoxShape.circle,
                            ),
                          ),
                          Image.asset(
                            'assets/icons/${expenses[index].category.icon}.png',
                            scale: 2,
                            color: Colors.white,
                          )
                          // transactionList[index]['icon'],
                        ],
                      ),
                      const Gap(8.0),
                      Expanded(
                        child: AppText(
                          text: expenses[index].category.name,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      CardText(
                        isTotalPrice: false,
                        headingText: '₹ ${expenses[index].amount}.00\n',
                        priceText: DateFormat('dd/MM/yyyy')
                            .format(expenses[index].date),
                        headingTextColor:
                            Theme.of(context).colorScheme.onBackground,
                        priceTextColor: Theme.of(context).colorScheme.outline,
                        headingFontSize: 14.0,
                        priceTextFontSize: 10.0,
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ),
              ),
              separatorBuilder: (context, index) => const Gap(10.0),
              itemCount: expenses.length,
            ),
          );
  }
}
