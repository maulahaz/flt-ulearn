// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../configs/x_configs.dart';

class MyText extends StatelessWidget {
  final String title; 
  final double? fSize; 
  final Color? color; 
  final String? fName; 
  final bool isBold; 
  final bool isUnderline;

  MyText(this.title, {
    Key? key,
    this.fSize,
    this.color,
    this.fName,
    this.isBold  = false,
    this.isUnderline = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title, style: TextStyle(
    fontSize: fSize ?? 14,
    color: color ?? cTx1,
    fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
    fontFamily: fName,
    decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
  ));
  }
}
