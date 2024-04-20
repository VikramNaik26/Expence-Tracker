import 'package:expence_tracker/screens/add_expence/blocs/create_category_bloc/create_category_bloc.dart';
import 'package:expence_tracker/screens/add_expence/utils/get_contrast_color.dart';
import 'package:expence_tracker/screens/add_expence/widgets/expence_input_box.dart';
import 'package:expence_tracker/widgets/app_text.dart';
import 'package:expence_tracker/widgets/submit_button.dart';
import 'package:expense_repository/expense_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
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

  Future<dynamic> categoryDialogBox(BuildContext context) {
    return showDialog(
      context: context,
      builder: (cTa) {
        bool isExpanded = false;
        String iconSelected = '';
        Color categoryColor = Colors.white;

        TextEditingController categoryNameController = TextEditingController();
        TextEditingController categoryIconController = TextEditingController();
        TextEditingController categoryColorController = TextEditingController();

        bool isLoading = false;

        return BlocProvider.value(
          value: context.read<CreateCategoryBloc>(),
          child: StatefulBuilder(
            builder:
                (BuildContext cTa, void Function(void Function()) setState) {
              return BlocListener<CreateCategoryBloc, CreateCategoryState>(
                listener: (context, state) {
                  if (state is CreateCategorySuccess) {
                    Navigator.pop(cTa);
                  } else if (state is CreateCategoryLoading) {
                    setState(() {
                      isLoading = true;
                    });
                  }
                },
                child: AlertDialog(
                  title: const Text('Create a Category'),
                  content: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: categoryNameController,
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
                          controller: categoryIconController,
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
                            ? Container(
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
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 5,
                                      crossAxisSpacing: 5,
                                    ),
                                    itemCount: myCategoriesIcon.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            iconSelected =
                                                myCategoriesIcon[index];
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
                                              color: iconSelected ==
                                                      myCategoriesIcon[index]
                                                  ? Colors.green
                                                  : Colors.grey,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                        const Gap(16.0),
                        TextFormField(
                          controller: categoryColorController,
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
                                        text: 'SELECT',
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
                              color:
                                  getTextColor(categoryColor).withOpacity(0.65),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const Gap(16.0),
                        SubmitButton(
                          text: 'CREATE',
                          isLoading: isLoading,
                          // enableGradientBackground: true,
                          onClick: () {
                            Category category = Category.empty;
                            category.categoryId = const Uuid().v1();
                            category.name = categoryNameController.text;
                            category.icon = iconSelected;
                            category.color = categoryColor.value;
                            context
                                .read<CreateCategoryBloc>()
                                .add(CreateCategory(category));
                            // Navigator.pop(cTa);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
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
