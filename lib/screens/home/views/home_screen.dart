import 'dart:math';

import 'package:expence_tracker/screens/add_expence/blocs/create_category_bloc/create_category_bloc.dart';
import 'package:expence_tracker/screens/add_expence/blocs/create_expense_bloc/create_expense_bloc.dart';
import 'package:expence_tracker/screens/add_expence/blocs/get_categories_bloc/get_categories_bloc.dart';
import 'package:expence_tracker/screens/add_expence/blocs/get_expenses_bloc/get_expenses_bloc.dart';
import 'package:expence_tracker/screens/add_expence/views/add_expenses.dart';
import 'package:expence_tracker/screens/home/views/main_screen.dart';
import 'package:expence_tracker/screens/stats/stats.dart';
import 'package:expense_repository/expense_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int index = 0;
  Color selectedItem = Colors.black;
  Color unSelectedItem = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetExpensesBloc, GetExpensesState>(
      builder: (context, state) {
        if (state is GetExpensesSuccess) {
          return Scaffold(
            // appBar: AppBar(),
            bottomNavigationBar: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30),
              ),
              child: BottomNavigationBar(
                onTap: (value) {
                  setState(() {
                    index = value;
                  });
                },
                showSelectedLabels: false,
                showUnselectedLabels: false,
                backgroundColor: Colors.white,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(
                      index == 0
                          ? Icons.grid_view_rounded
                          : Icons.grid_view_outlined,
                      size: 24,
                      color: index == 0 ? selectedItem : unSelectedItem,
                    ),
                    label: 'home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.bar_chart_outlined,
                      size: 24,
                      color: index == 1 ? selectedItem : unSelectedItem,
                    ),
                    label: 'graph',
                  ),
                ],
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MultiBlocProvider(
                      providers: [
                        BlocProvider(
                          create: (context) => CreateCategoryBloc(
                            FirebaseExpenseRepo(),
                          ),
                        ),
                        BlocProvider(
                          create: (context) => GetCategoriesBloc(
                            FirebaseExpenseRepo(),
                          )..add(GetCategories()),
                        ),
                        BlocProvider(
                          create: (context) => CreateExpenseBloc(
                            FirebaseExpenseRepo(),
                          ),
                        ),
                      ],
                      child: const AddExpense(),
                    ),
                  ),
                );
              },
              shape: const CircleBorder(),
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.tertiary,
                      Theme.of(context).colorScheme.secondary,
                      Theme.of(context).colorScheme.primary,
                    ],
                    transform: const GradientRotation(pi / 4),
                  ),
                ),
                child: const Icon(
                  Icons.add,
                  size: 32,
                ),
              ),
            ),
            body: index == 0 ?  MainScreen(state.expenses) : const StatScreen(),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
