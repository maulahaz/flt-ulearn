import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flt_ulearn/global.dart';

import 'common/helpers/x_helpers.dart';
import 'features/welcome/x_welcome.dart';
// import 'features/counter/counter_pg.dart';
// import 'pages/home/home_pg.dart';

Future<void> main() async{
  await Global.init();
  HttpHelper().post("api/login");

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: CounterPage(),
      home: WelcomePage(),
    );
  }
}