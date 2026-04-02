import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? label;
  final Function()? onPressed;

  const CustomButton({super.key, this.label, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(label ?? 'Custom Button'),
    );
  }
}
