import 'package:expence_tracker/screens/stats/chart.dart';
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
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
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
                child: const MyChart(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
