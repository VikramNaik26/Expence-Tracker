import 'package:expence_tracker/screens/add_expence/utils/get_contrast_color.dart';
import 'package:expence_tracker/screens/add_expence/widgets/expence_input_box.dart';
import 'package:expence_tracker/widgets/app_text.dart';
import 'package:expence_tracker/widgets/submit_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
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

  List<String> myCategoriesIcon = [
    'entertainment',
    'food',
    'home',
    'pet',
    'shopping',
    'tech',
    'travel',
  ];

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
                text: 'Add Expense',
                fontSize: 22,
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
              const Gap(22.0),
              SubmitButton(
                text: 'Save',
                onClick: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> categoryDialogBox(BuildContext context) {
    return showDialog(
      context: context,
      builder: (cTa) {
        bool isExpanded = false;
        late String iconSelected = '';
        late Color categoryColor = Colors.white;
        return StatefulBuilder(
          builder:
              (BuildContext context, void Function(void Function()) setState) {
            return AlertDialog(
              title: const Text('Create a Category'),
              content: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const Gap(16.0),
                    TextFormField(
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      readOnly: true,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(
                          CupertinoIcons.chevron_down,
                          size: 16,
                          color: Colors.grey,
                        ),
                        isDense: true,
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Icon",
                        border: OutlineInputBorder(
                          borderRadius: isExpanded
                              ? const BorderRadius.vertical(
                                  top: Radius.circular(10.0),
                                )
                              : BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    isExpanded
                        ? categoryIconList(setState, iconSelected)
                        : const SizedBox.shrink(),
                    const Gap(16.0),
                    colorPickerInput(
                      context,
                      setState,
                      categoryColor,
                    ),
                    const Gap(16.0),
                    SubmitButton(
                      text: 'Save',
                      onClick: () {
                        // TODO: Create category object
                        Navigator.pop(cTa);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Container categoryIconList<T>(
      void Function(void Function()) setState, String iconSelected) {
    return Container(
      width: double.maxFinite,
      height: 200,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          itemCount: myCategoriesIcon.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  iconSelected = myCategoriesIcon[index];
                });
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/icons/${myCategoriesIcon[index]}.png',
                    ),
                  ),
                  border: Border.all(
                    color: iconSelected == myCategoriesIcon[index]
                        ? Colors.green
                        : Colors.grey,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  TextFormField colorPickerInput<T>(BuildContext context,
      void Function(void Function()) setState, Color categoryColor) {
    return TextFormField(
      onTap: () {
        showDialog(
          context: context,
          builder: (cTa2) {
            return AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ColorPicker(
                    onColorChanged: (value) {
                      setState(() {
                        categoryColor = value;
                      });
                    },
                    pickerColor: Colors.white,
                  ),
                  SubmitButton(
                    text: 'Save',
                    onClick: () {
                      Navigator.pop(cTa2);
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
      textAlignVertical: TextAlignVertical.center,
      readOnly: true,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: categoryColor,
        hintText: "Color",
        hintStyle: TextStyle(
          color: getTextColor(categoryColor).withOpacity(0.65),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
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
