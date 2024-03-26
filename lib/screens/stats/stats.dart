import 'package:expence_tracker/screens/stats/widgets/chart.dart';
import 'package:expence_tracker/screens/stats/widgets/custom_tabbar.dart';
import 'package:expence_tracker/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class StatScreen extends StatelessWidget {
  const StatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Icon(Icons.monetization_on_outlined),
                  ),
                  const Gap(10.0),
                  const Expanded(
                    child: AppText(
                      text: 'Transactions',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Gap(20.0),
              const CustomTabBar(),
              const Gap(16.0),
              Container(
                padding: const EdgeInsets.only(
                  left: 18,
                  top: 24,
                  right: 6,
                  bottom: 14,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    AppText(
                      text: '01 Jan 2024 - 26 Mar 2024',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      textColor: Theme.of(context).colorScheme.outline,
                    ),
                    const Gap(6),
                    AppText(
                      text: '₹ 3500.00',
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      textColor: Colors.blue.shade900,
                    ),
                    const Gap(16),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      child: const MyChart(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

