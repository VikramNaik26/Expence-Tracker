import 'package:expence_tracker/screens/add_expence/views/category_dialog_box.dart';
import 'package:expence_tracker/screens/add_expence/widgets/expence_input_box.dart';
import 'package:expence_tracker/widgets/app_text.dart';
import 'package:expence_tracker/widgets/submit_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController expenseController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    dateController.text = DateFormat('EEE, dd/MM/yyyy').format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
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
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(
                    Icons.category_rounded,
                    size: 18,
                    color: Colors.grey.shade400,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      CupertinoIcons.add,
                      color: Colors.grey.shade400,
                      size: 18,
                    ),
                    onPressed: () {
                      categoryDialogBox(context);
                    },
                  ),
                  hintText: "Category",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const Gap(16.0),
              datePickerInput(context),
              const Expanded(
                child: Gap(22.0),
              ),
              SubmitButton(
                text: 'SAVE',
                enableGradientBackground: true,
                onClick: () {},
              ),
            ],
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
          initialDate: selectedDate,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(
            const Duration(days: 365),
          ),
        );

        if (newDate != null) {
          setState(() {
            dateController.text = DateFormat('EEE, dd/MM/yyyy').format(newDate);
            selectedDate = newDate;
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
