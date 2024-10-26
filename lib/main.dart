import 'package:flt_ulearning/common/routes/app_routes.dart';
import 'package:flt_ulearning/features/application/views/application.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'global.dart';
import 'features/signin/views/signin.dart';
import 'features/signup/views/signup.dart';
import 'features/welcome/views/welcome.dart';

Future<void> main() async {
  await Global.init();
  runApp(const ProviderScope(child: MyApp()));
}

var routesMap = {
  '/': (context) => Welcome(),
  '/signin': (context) => Signin(),
  '/signup': (context) => Signup(),
  '/application': (context) => Application(),
};

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: AppPages.generateRouteSettings,
        // initialRoute: '/',
        // routes: routesMMap,
        // home: Welcome(),
      ),
    );
  }
}

final appCount = StateProvider<int>((ref) {
  return 0;
});

// class MyHomePage extends StatefulWidget {
class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int count = ref.watch(appCount);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Riverpod Apps'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              count.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(appCount.notifier).state++;
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
