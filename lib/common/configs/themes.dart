import 'package:flt_ulearn/common/configs/x_configs.dart';
import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    primaryIconTheme: IconThemeData(color: cWhite), //<- Ngrubah Warna Drawer
    fontFamily: 'Poppins', //'DancingScript', //'Nova', //
  );

  static final dark = ThemeData(
    primaryColor: cBg1,
    brightness: Brightness.dark,
    // fontFamily: 'Poppins',
  );
}


TextStyle get myLinkText {
  return TextStyle(
    fontFamily: "Poppins",
    fontSize: 14,
    color: cYellow,
  );
}

TextStyle get myLinkText2 {
  return TextStyle(
    fontFamily: "Poppins",
    fontSize: 14,
    color: cBlue,
    decoration: TextDecoration.underline,
    decorationStyle: TextDecorationStyle.double,
  );
}