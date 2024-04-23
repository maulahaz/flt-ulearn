import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flt_ulearn/global.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common/helpers/x_helpers.dart';
import 'features/signin/x_signin.dart';
import 'features/welcome/x_welcome.dart';
import 'features/counter/counter_pg.dart';

Future<void> main() async {
  await Global.init();
  HttpHelper().post("api/login");

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: WelcomePage(),
          initialRoute: '/signin',
          routes: {
            '/welcome': (context) => WelcomePage(),
            '/counter': (context) => CounterPage(),
            '/signin': (context) => SigninPage(),
            // "/signup":(context)=>const SignUp(),
          },
        );
      },
    );
  }
}
