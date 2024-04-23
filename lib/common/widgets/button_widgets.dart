import 'package:flt_ulearn/common/configs/x_configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'x_widgets.dart';

Widget appButton({
  double width = 325,
  double height = 50,
  String buttonName = "",
  bool isLogin = true,
  BuildContext? context,
  void Function()? func
}) {
  return GestureDetector(
    onTap: func,
    child: Container(
      width: width.w,
      height: height.h,
      //isLogin true then send primary color else send white color
      decoration: appBoxShadow(
          color: isLogin ? cElement1 : cWhite,
          boxBorder: Border.all(color: cElement1)),
      child: Center(
          child: Text16Normal(
              text: buttonName,
              color: isLogin
                  ? cBg1
                  : cTx1)),
    ),
  );
}
