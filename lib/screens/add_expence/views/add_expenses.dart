import 'package:expence_tracker/widgets/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddExpense extends StatelessWidget {
  const AddExpense({super.key});

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
                text: 'Add Expense',
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              const Gap(20.0),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      CupertinoIcons.money_dollar,
                      size: 18,
                      color: Colors.grey.shade400,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const Gap(30.0),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(
                    Icons.category_rounded,
                    size: 18,
                    color: Colors.grey.shade400,
                  ),
                  hintText: "Category",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const Gap(16.0),
              TextFormField(
                readOnly: true,
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(
                      const Duration(days: 365),
                    ),
                  );
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
              ),
              const Gap(22.0),
              SizedBox(
                width: double.maxFinite,
                height: kToolbarHeight,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const AppText(
                    text: 'Save',
                    textColor: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
