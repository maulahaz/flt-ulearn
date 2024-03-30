import 'package:flutter/material.dart';

import '../configs/x_configs.dart';

class TextFieldSearch extends StatelessWidget {
  final TextEditingController controller;
  final Function(String value)? onChanged;
  final VoidCallback? onTap;

  const TextFieldSearch({
    super.key,
    required this.controller,
    this.onChanged,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      decoration: BoxDecoration(
        color: cWhite,
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: TextFormField(
        onTap: onTap,
        readOnly: onTap != null,
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: const Icon(
            Icons.search,
            color: kAppPrimary,
          ),
          contentPadding: const EdgeInsets.all(10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.0),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}