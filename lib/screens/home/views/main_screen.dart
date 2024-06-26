import 'package:expence_tracker/screens/home/widgets/expenses_card.dart';
import 'package:expence_tracker/screens/home/widgets/transaction_list.dart';
import 'package:expence_tracker/widgets/app_text.dart';
import 'package:expense_repository/expense_repository.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MainScreen extends StatelessWidget {
  final List<Expense> expenses;
  const MainScreen(this.expenses, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
          child: Column(
            children: [
              const _AppHeader(),
              const Gap(20.0),
              const ExpensesCard(),
              const Gap(32.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppText(
                    text: 'Transactions',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: AppText(
                      text: 'View all',
                      fontSize: 14,
                      textColor: Theme.of(context).colorScheme.outline,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              const Gap(14.0),
              TransactionList(expenses: expenses),
            ],
          ),
        ),
      ),
    );
  }
}

class _AppHeader extends StatelessWidget {
  const _AppHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
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
          icon: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: const Icon(
              Icons.settings,
            ),
          ),
        ),
      ],
    );
  }
}
