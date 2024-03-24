import 'package:expence_tracker/screens/home/views/home_screen.dart';
import 'package:flutter/material.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expence Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          background: Colors.grey.shade100,
          onBackground: Colors.black,
          primary: const Color(0xff00B2E7),
          secondary: const Color(0xffE064F7),
          tertiary: const Color(0xffFF8D6C),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
