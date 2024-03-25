import 'package:flutter/material.dart';

List<Map<String, dynamic>> transactionList = [
  {
    'icon': const Icon(Icons.fastfood_outlined, color: Colors.white),
    'color': Colors.yellow.shade700,
    'name': 'Food',
    'totalAmt': '- ₹ 65.00',
    'date': 'Today'
  },
  {
    'icon': const Icon(Icons.shopping_bag_outlined, color: Colors.white),
    'color': Colors.purple.shade400,
    'name': 'Shopping',
    'totalAmt': '- ₹ 265.00',
    'date': 'Today'
  },
  {
    'icon': const Icon(Icons.health_and_safety_outlined, color: Colors.white),
    'color': Colors.green.shade400,
    'name': 'Health',
    'totalAmt': '- ₹ 120.00',
    'date': 'Yesterday'
  },
  {
    'icon': const Icon(Icons.travel_explore, color: Colors.white),
    'color': Colors.blue.shade700,
    'name': 'Travel',
    'totalAmt': '- ₹ 1500.00',
    'date': 'Yesterday'
  },
];
