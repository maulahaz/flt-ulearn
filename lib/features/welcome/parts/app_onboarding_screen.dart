import 'package:flt_ulearn/common/helpers/widgets_hlp.dart';
import 'package:flutter/material.dart';

import '../../../../global.dart';
import '../../../common/configs/x_configs.dart';
import '../../../common/widgets/x_widgets.dart';

class AppOnboardingScreen extends StatelessWidget {
  final PageController controller;
  final String imagePath;
  final String title;
  final String subTitle;
  final int index;
  final BuildContext context;

  const AppOnboardingScreen(
      {Key? key,
      required this.controller,
      required this.imagePath,
      required this.title,
      required this.subTitle,
      required this.index,
      required this.context})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          fit: BoxFit.fitWidth,
        ),
        Container(
            margin: EdgeInsets.only(top: 15), 
            child: Text(title, style:myStyle(fSize: 24))),
        Container(
          margin: EdgeInsets.only(top: 15),
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Text(subTitle, style:myStyle(fSize: 16)),
        ),
        _nextButton(index, controller, context)
      ],
    );
  }
}

Widget _nextButton(int index, PageController controller, BuildContext context) {
  return GestureDetector(
    onTap: () {
      if (index < 3) {
        controller.animateToPage(index,
            duration: const Duration(milliseconds: 300), curve: Curves.linear);
      } else {
        //remember if we are first time or not
        Global.storageService.setBool(STORAGE_DEVICE_OPEN_FIRST_KEY, true);

        Navigator.pushNamed(
          context,
          "/signin",
        );
      }
    },
    child: Container(
      width: 325,
      height: 50,
      margin: EdgeInsets.only(top: 100, left: 25, right: 25),
      decoration: appBoxShadow(),
      child: Center(
          child: Text(index < 3 ? "next" : "Get started",
              style: TextStyle(color: cWhite))),
    ),
  );
}
