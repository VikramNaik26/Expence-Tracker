import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpenceInputBox extends StatelessWidget {
  const ExpenceInputBox({
    super.key,
    required this.expenseController,
  });

  final TextEditingController expenseController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
