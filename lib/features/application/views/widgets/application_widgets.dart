import 'package:flt_ulearning/common/utils/app_colors.dart';
import 'package:flt_ulearning/common/utils/image_res.dart';
import 'package:flt_ulearning/common/widgets/image_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../home/views/home.dart';

var bottomTabs = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
      icon: _bottomContainer(),
      activeIcon: _bottomContainer(color: AppColors.primaryElement),
      backgroundColor: AppColors.primaryBackground,
      label: "Home"),
  BottomNavigationBarItem(
      icon: _bottomContainer(imagePath: ImageRes.search),
      activeIcon: _bottomContainer(
          imagePath: ImageRes.search, color: AppColors.primaryElement),
      backgroundColor: AppColors.primaryBackground,
      label: "Search"),
  BottomNavigationBarItem(
      icon: _bottomContainer(imagePath: ImageRes.play),
      activeIcon: _bottomContainer(
          imagePath: ImageRes.play, color: AppColors.primaryElement),
      backgroundColor: AppColors.primaryBackground,
      label: "Play"),
  BottomNavigationBarItem(
      icon: _bottomContainer(imagePath: ImageRes.message),
      activeIcon: _bottomContainer(
          imagePath: ImageRes.message, color: AppColors.primaryElement),
      backgroundColor: AppColors.primaryBackground,
      label: "Message"),
  BottomNavigationBarItem(
      icon: _bottomContainer(imagePath: ImageRes.profile),
      activeIcon: _bottomContainer(
          imagePath: ImageRes.profile, color: AppColors.primaryElement),
      backgroundColor: AppColors.primaryBackground,
      label: "Profile"),
];

Widget _bottomContainer(
    {double width = 15,
    double height = 15,
    String imagePath = ImageRes.home,
    Color color = AppColors.primaryFourthElementText}) {
  return SizedBox(
    width: width.w,
    height: height.w,
    child: appImageWithColor(imagePath: imagePath, color: color),
  );
}

Widget appScreen({int index = 0}) {
  List<Widget> screens = [
    Home(),
    Center(child: appImage(imagePath: ImageRes.search)),
    Center(child: appImage(imagePath: ImageRes.play)),
    Center(child: appImage(imagePath: ImageRes.message)),
    Center(child: appImage(imagePath: ImageRes.profile)),
  ];

  return screens[index];
}
