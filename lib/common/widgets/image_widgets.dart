import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../configs/x_configs.dart';

Widget appImage(
    {String imagePath = pathImgUser,
    double width = 16,
    double height = 16}) {
  return Image.asset(
    imagePath.isEmpty ? pathImgUser : imagePath,
    width: width.w,
    height: height.h,
  );
}
