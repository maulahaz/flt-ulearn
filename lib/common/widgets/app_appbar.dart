import 'package:flutter/material.dart';

import '../configs/x_configs.dart';
import 'x_widgets.dart';

AppBar buildAppbar() {
  return AppBar(

    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        color: Colors.grey.withOpacity(0.3),
        height: 1,
      ),
    ),
    title: Text16Normal(text: "Login", color: cTx1),
  );
}

// class AppAppbar extends StatelessWidget {
//   const AppAppbar({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       elevation: 0,
//       backgroundColor:cTransparent,
//       leading: Padding(
//         padding: const EdgeInsets.all(8),
//         child: Icon(Icons.arrow_back_ios),
//       ),
//       actions: [
//         Padding(
//           padding: const EdgeInsets.only(right:8.0),
//           child: Icon(Icons.menu),
//         )
//       ],
//     );
//   }
// }
