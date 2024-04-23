import 'package:flutter/material.dart';

import '../helpers/x_helpers.dart';
import '../configs/x_configs.dart';

class MyButtons {
  static Widget showMyButtons(
    BuildContext context,
    String label,
    Color txColor,
    Color bgColor,
    Function() function, {
    required bool outlined,
    required bool gradiented,
  }) {
    //--USING ELEVATED BUTTON v.1:
    //----------------------------------------------------------------
    // return ElevatedButton(
    //   onPressed: function,
    //   child: Text(label, style: getFont(16, color: cBlack)),
    //   style: ElevatedButton.styleFrom(
    //     backgroundColor: outlined ? kTransparent : color,
    //     side: outlined ? BorderSide(width:2, color:color) : null,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(12),
    //     ),
    //   ),
    // );

    //--USING ELEVATED BUTTON v.2:
    //----------------------------------------------------------------
    // return ElevatedButton(
    //   onPressed: function,
    //   style: ElevatedButton.styleFrom(
    //     padding: const EdgeInsets.all(0.0),
    //     elevation: 5,
    //   ),
    //   child: Container(
    //     padding: EdgeInsets.all(10),
    //     constraints: BoxConstraints(minWidth: 88.0),
    //     decoration: BoxDecoration(
    //         color: outlined ? kTransparent : color,
    //         gradient: gradiented ? kAppGradientPrim : null,
    //         borderRadius: BorderRadius.all(Radius.circular(10)),
    //         border: outlined ? Border.all(color: color, width: 2) : null),
    //     child: Text(label, style: getFont(16, color: cBlack)),
    //   ),
    // );

    //--USING MATERIAL BUTTON (will take all Width):
    //----------------------------------------------------------------
    return MaterialButton(
      onPressed: function,
      hoverColor: cTransparent,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(kDefaultPadding * 0.5),
        decoration: BoxDecoration(
            color: outlined ? cTransparent : bgColor,
            gradient: gradiented ? kAppGradientPrim : null,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: outlined ? Border.all(color: bgColor, width: 2) : null),
        child: Text(label, style: getFont(16, color: txColor)),
      ),
    );
  }

  static Widget primary(
      BuildContext context, String label, Function() function) {
    return showMyButtons(context, label, cBlack, kAppPrimary, function,
        outlined: false, gradiented: false);
  }

  static Widget warning(
      BuildContext context, String label, Function() function) {
    return showMyButtons(context, label, cBlack, cBgWarning, function,
        outlined: false, gradiented: false);
  }

  static Widget danger(
      BuildContext context, String label, Function() function) {
    return showMyButtons(context, label, cWhite, cRed, function,
        outlined: false, gradiented: false);
  }

  static Widget disabled(BuildContext context, String label) {
    return showMyButtons(context, label, cWhite, cGrey, () {},
        outlined: false, gradiented: false);
  }

  static Widget primaryOutlined(
      BuildContext context, String label, Function() function) {
    return showMyButtons(context, label, cBlack, kAppPrimary, function,
        outlined: true, gradiented: false);
  }

  static Widget dangerOutlined(
      BuildContext context, String label, Function() function) {
    return showMyButtons(context, label, cRed, cRed, function,
        outlined: true, gradiented: false);
  }

  static Widget primaryGradiented(
      BuildContext context, String label, Function() function) {
    return showMyButtons(context, label, cBlack, kAppPrimary, function,
        outlined: false, gradiented: true);
  }
}
