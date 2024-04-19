import 'package:expence_tracker/widgets/app_text.dart';
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

  List<String> myCategoriesIcon = [
    'entertainment',
    'food',
    'home',
    'pet',
    'shopping',
    'tech',
    'travel',
  ];

  late String iconSelected = '';

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
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextFormField(
                  controller: expenseController,
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
                      showDialog(
                        context: context,
                        builder: (cTa) {
                          bool isExpanded = false;
                          return StatefulBuilder(
                            builder: (BuildContext context,
                                void Function(void Function()) setState) {
                              return AlertDialog(
                                title: const Text('Create a Category'),
                                content: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextFormField(
                                        readOnly: true,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintText: "Name",
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
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
                                          ? Container(
                                              width: double.maxFinite,
                                              height: 200,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                  bottom: Radius.circular(10.0),
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: GridView.builder(
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 3,
                                                    mainAxisSpacing: 5,
                                                    crossAxisSpacing: 5,
                                                  ),
                                                  itemCount:
                                                      myCategoriesIcon.length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          iconSelected =
                                                              myCategoriesIcon[
                                                                  index];
                                                        });
                                                      },
                                                      child: Container(
                                                        width: 50,
                                                        height: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                            image: AssetImage(
                                                              'assets/icons/${myCategoriesIcon[index]}.png',
                                                            ),
                                                          ),
                                                          border: Border.all(
                                                            color: iconSelected ==
                                                                    myCategoriesIcon[
                                                                        index]
                                                                ? Colors.green
                                                                : Colors.grey,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
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
                                        readOnly: true,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintText: "Color",
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
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
              TextFormField(
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
                      dateController.text =
                          DateFormat('EEE, dd/MM/yyyy').format(newDate);
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
