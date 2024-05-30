import 'package:expence_tracker/screens/add_expence/blocs/create_expense_bloc/create_expense_bloc.dart';
import 'package:expence_tracker/screens/add_expence/blocs/get_categories_bloc/get_categories_bloc.dart';
import 'package:expence_tracker/screens/add_expence/utils/get_contrast_color.dart';
import 'package:expence_tracker/screens/add_expence/views/category_dialog_box.dart';
import 'package:expence_tracker/screens/add_expence/widgets/expence_input_box.dart';
import 'package:expence_tracker/widgets/app_text.dart';
import 'package:expence_tracker/widgets/submit_button.dart';
import 'package:expense_repository/expense_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController expenseController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  late Expense expense;
  bool isLoading = false;

  // DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    dateController.text = DateFormat('EEE, dd/MM/yyyy').format(DateTime.now());
    expense = Expense.empty;
    expense.expenseId = const Uuid().v1();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateExpenseBloc, CreateExpenseState>(
      listener: (context, state) {
        if (state is CreateExpenseSuccess) {
          Navigator.pop(context, expense);
        } else if (state is CreateExpenseLoading) {
          setState(() {
            isLoading = true;
          });
        }
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          body: BlocBuilder<GetCategoriesBloc, GetCategoriesState>(
            builder: (context, state) {
              if (state is GetCategoriesSuccess) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const AppText(
                        text: 'ADD EXPENSE',
                        fontSize: 24,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                      ),
                      const Gap(20.0),
                      ExpenceInputBox(expenseController: expenseController),
                      const Gap(30.0),
                      TextFormField(
                        readOnly: true,
                        onTap: () {},
                        controller: categoryController,
                        style: TextStyle(
                          color: getTextColor(
                            Color(expense.category.color),
                          ),
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: expense.category == Category.empty
                              ? Colors.white
                              : Color(expense.category.color),
                          prefixIcon: expense.category == Category.empty
                              ? Icon(
                                  Icons.category_rounded,
                                  size: 18,
                                  color: Colors.grey.shade400,
                                )
                              : Image.asset(
                                  'assets/icons/${expense.category.icon}.png',
                                  scale: 2,
                                  color: getTextColor(
                                    Color(expense.category.color),
                                  ),
                                ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              CupertinoIcons.add,
                              color: Colors.grey.shade400,
                              size: 18,
                            ),
                            onPressed: () async {
                              var newCategory =
                                  await categoryDialogBox(context);
                              // print(newCategory);
                              setState(() {
                                state.categories.insert(0, newCategory);
                              });
                            },
                          ),
                          hintText: "Category",
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(10.0),
                            ),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(10.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: state.categories.isEmpty
                              ? const Center(
                                  child: AppText(
                                    text: 'No Category exist! Create one',
                                    fontSize: 18,
                                    textColor: Colors.grey,
                                  ),
                                )
                              : ListView.builder(
                                  itemCount: state.categories.length,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      child: ListTile(
                                        onTap: () {
                                          setState(() {
                                            expense.category =
                                                state.categories[index];
                                            categoryController.text =
                                                expense.category.name;
                                          });
                                        },
                                        leading: Image.asset(
                                          'assets/icons/${state.categories[index].icon}.png',
                                          scale: 2,
                                          color: getTextColor(
                                            Color(
                                                state.categories[index].color),
                                          ),
                                        ),
                                        title: AppText(
                                          text: state.categories[index].name,
                                          fontSize: 16,
                                          textColor: getTextColor(
                                            Color(
                                                state.categories[index].color),
                                          ),
                                        ),
                                        tileColor: Color(
                                            state.categories[index].color),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                        ),
                      ),
                      const Gap(16.0),
                      datePickerInput(context),
                      const Gap(22.0),
                      if (isLoading)
                        const Center(
                          child: CircularProgressIndicator(),
                        )
                      else
                        SubmitButton(
                          text: 'SAVE',
                          enableGradientBackground: true,
                          onClick: () {
                            setState(() {
                              expense.amount =
                                  int.parse(expenseController.text);
                            });

                            context
                                .read<CreateExpenseBloc>()
                                .add(CreateExpense(expense));
                          },
                        ),
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  TextFormField datePickerInput(BuildContext context) {
    return TextFormField(
      controller: dateController,
      readOnly: true,
      onTap: () async {
        DateTime? newDate = await showDatePicker(
          context: context,
          initialDate: expense.date,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(
            const Duration(days: 365),
          ),
        );

        if (newDate != null) {
          setState(() {
            dateController.text = DateFormat('EEE, dd/MM/yyyy').format(newDate);
            // selectedDate = newDate;
            expense.date = newDate;
          });
        }
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(
          Icons.date_range_rounded,
          size: 18,
          color: Colors.grey.shade400,
        ),
        hintText: "Date",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
