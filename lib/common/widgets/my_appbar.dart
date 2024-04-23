import 'package:flt_ulearn/common/widgets/x_widgets.dart';
import 'package:flutter/material.dart';

import '../configs/x_configs.dart';

// class MyAppBar extends StatelessWidget {
//   final String title;

//   const MyAppBar(this.title);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       bottom: PreferredSize(
//         preferredSize: const Size.fromHeight(1),
//         child: Container(
//           color: Colors.grey.withOpacity(0.3),
//           height: 1,
//         ),
//       ),
//       title: MyText(title: "Login", color: cTx1),
//     );
//   }
// }

AppBar MyAppBar(String title) {
  return AppBar(

    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        color: Colors.grey.withOpacity(0.3),
        height: 1,
      ),
    ),
    title: MyText(title, color: cTx1),
  );
}
