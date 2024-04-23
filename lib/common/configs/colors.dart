import 'package:flutter/material.dart';

//--Main Colors:
//--------------------------------------------------
const cRed = Color(0xFFE92E30);
const cGreen = Color(0xFF6AC259);
const cBlue = Colors.blue;
const cYellow = Colors.yellow;
const cGrey = Color(0xFFC1C1C1);
const cWhite = Color(0xFFFFFFFF);
const cBlack = Color(0xFF101010);
const cTransparent = Colors.transparent;

//--App Colors Pallets:
//--------------------------------------------------
const cPrimer = Color.fromARGB(255, 104, 133, 156);
const cSecond = Color.fromARGB(255, 243, 231, 206);
//primaryText
const cTx1 = cBlack;
//secondarText = Grey
const cTx2 = Color.fromARGB(255, 102, 102, 102);
//primaryBackground
const cBg1 = cWhite;
//secondaryBackground = Grey
const cBg2 = Color.fromARGB(255, 247, 247, 249);
//primaryElement = blue
const cElement1 = Color.fromARGB(255, 61, 61, 216);
//
const kAppPrimary = Color.fromRGBO(157,195,230,1);
const kAppPrimaryDark = Color(0xffa2d2ff);
const kAppPrimaryDark2 = Color(0xffcdb4db);
const kAppPrimaryLight = Color(0xffbde0fe);
const kAppSecondary = Color(0xffafcc);
const kAppSecondaryLight = Color(0xffc8dd);

//--Bootstrap Color Standards: (Primary, Secondary,Success,Danger,Warnig,Info,Light,Dark)
//--------------------------------------------------
const cBgPrimary = Color(0xFF007BFF);
const cBgSecondary = Color(0xFF6C757D);
const cBgSuccess = Color(0xFF28A745);
const cBgDanger = Color(0xFFDC3545);
const cBgWarning = Color(0xFFFFC107);
const cBgInfo = Color(0xFF17A2B8);
const cBgLight = Color(0xFFF8F9FA);
const cBgDark = Color(0xFF343A40);
const cBgDefault = Color(0xffe0e0e0);


//--Gradient:
const kAppGradientPrim = LinearGradient(
  colors: [kAppPrimary, cWhite, kAppPrimaryDark],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

const kPrimaryGradient = LinearGradient(
  colors: [kAppPrimary, cWhite],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);