import 'dart:math';

import 'package:expence_tracker/widgets/app_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyChart extends StatefulWidget {
  const MyChart({super.key});

  @override
  State<MyChart> createState() => _MyChartState();
}

class _MyChartState extends State<MyChart> {
  @override
  Widget build(BuildContext context) {
    return BarChart(
      mainBarData(),
    );
  }

  BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          width: 10,
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.tertiary,
            ],
            transform: const GradientRotation(pi / 4),
          ),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 5,
            color: Colors.grey.shade300,
          ),
        ),
      ],
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(
        8,
        (i) {
          switch (i) {
            case 0:
              return makeGroupData(0, 2);
            case 1:
              return makeGroupData(1, 3);
            case 2:
              return makeGroupData(2, 2);
            case 3:
              return makeGroupData(3, 4.5);
            case 4:
              return makeGroupData(4, 3.8);
            case 5:
              return makeGroupData(5, 1.5);
            case 6:
              return makeGroupData(6, 4);
            case 7:
              return makeGroupData(7, 3.8);
            default:
              return throw Error();
          }
        },
      );

  BarChartData mainBarData() {
    return BarChartData(
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 24,
            interval: 1,
            getTitlesWidget: leftTitle,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 28,
            getTitlesWidget: getTitlesWidget,
          ),
        ),
      ),
      borderData: FlBorderData(show: false),
      gridData: const FlGridData(show: false),
      barGroups: showingGroups(),
    );
  }

  SideTitleWidget getTitlesWidget(double value, TitleMeta meta) {
    final tileText = AppText(
      text: value < 8 ? '0${value + 1}' : '',
      fontSize: 10.0,
      fontWeight: FontWeight.bold,
      textColor: Colors.grey,
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: tileText,
    );
  }

  SideTitleWidget leftTitle(double value, TitleMeta meta) {
    final tileText = AppText(
      text: value < 6 ? '${value}K' : '',
      fontSize: 10.0,
      fontWeight: FontWeight.bold,
      textColor: Colors.grey,
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: tileText,
    );
  }
}
