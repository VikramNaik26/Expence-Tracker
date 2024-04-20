import 'dart:math';

import 'package:expence_tracker/widgets/app_text.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatefulWidget {
  const SubmitButton({
    super.key,
    required this.text,
    this.onClick,
    this.enableGradientBackground = false,
    this.isLoading = false,
  });

  final String text;
  final VoidCallback? onClick;
  final bool enableGradientBackground;
  final bool isLoading;

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: kToolbarHeight,
      decoration: BoxDecoration(
        gradient: widget.enableGradientBackground
            ? LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.tertiary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.primary,
                ],
                transform: const GradientRotation(pi / 4),
              )
            : null,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: widget.onClick,
        style: TextButton.styleFrom(
          backgroundColor: widget.enableGradientBackground
              ? Colors.transparent
              : Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: widget.isLoading
            ? const Center(child: CircularProgressIndicator())
            : AppText(
                text: widget.text,
                textColor: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
      ),
    );
  }
}
