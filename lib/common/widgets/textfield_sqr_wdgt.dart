import 'package:flutter/material.dart';

import '../configs/x_configs.dart';

class TextFieldSquare extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Function(String value)? onChanged;
  final bool obscureText;

  const TextFieldSquare({
    super.key,
    required this.controller,
    required this.label,
    this.onChanged,
    this.obscureText = false,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      height: 60.0,
      color: kAppPrimary.withOpacity(0.2),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(0),
          labelText: label,
          labelStyle: const TextStyle(color: cGrey),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}