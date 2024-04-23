import 'package:flutter/material.dart';

import '../configs/x_configs.dart';

//--Get Font Style Function:
// ========================================================================
TextStyle getFont(double fontSize,
    {Color? color, bool isBold = false, String? fontName}) {
  return new TextStyle(
    fontSize: fontSize,
    color: color ?? cTx1,
    fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
    fontFamily: fontName,
  );
}

TextStyle myStyle(
    {double? fSize, Color? color, String? fName, bool isBold = false, bool isUnderline = false, }) {
  return new TextStyle(
    fontSize: fSize ?? 14,
    color: color ?? cTx1,
    fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
    fontFamily: fName,
    decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
  );
}