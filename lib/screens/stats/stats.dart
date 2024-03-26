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
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppText(
                text: 'Transaction',
                fontSize: 20,
                fontWeight: FontWeight.bold,
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
