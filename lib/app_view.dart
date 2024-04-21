import 'package:expence_tracker/screens/add_expence/blocs/get_expenses_bloc/get_expenses_bloc.dart';
import 'package:expence_tracker/screens/home/views/home_screen.dart';
import 'package:expense_repository/expense_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expence Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          background: Colors.grey.shade300.withOpacity(0.5),
          onBackground: Colors.black,
          primary: const Color(0xff00B2E7),
          secondary: const Color(0xffE064F7),
          tertiary: const Color(0xffFF8D6C),
          outline: Colors.grey,
        ),
      ),
      home: BlocProvider(
        create: (context) => GetExpensesBloc(
          FirebaseExpenseRepo(),
        )..add(GetExpenses()),
        child: const HomeScreen(),
      ),
    );
  }
}
