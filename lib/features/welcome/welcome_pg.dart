import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/configs/x_configs.dart';
import 'x_welcome.dart';

// final indexProvider = StateProvider((ref) => 0);

class WelcomePage extends ConsumerWidget {
  WelcomePage({ Key? key }) : super(key: key);

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(indexDotProvider);
    return Scaffold(
      body: Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            margin: EdgeInsets.only(top: 30),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                //showing our three welcome pages
                PageView(
                  onPageChanged: (value){
                    ref.read(indexDotProvider.notifier).changeIndex(value);
                  },
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  children: [
                    //first page:
                    AppOnboardingScreen(controller: _controller,
                        imagePath: pathReading,
                        title: "First See Learning",
                        subTitle:
                            "Forget about the paper, now learning all in one place",
                        index: 1, context:context),
                    //second page:
                    AppOnboardingScreen(controller:_controller,
                        imagePath: pathMan,
                        title: "Connect With Everyone",
                        subTitle:
                            "Always keep in touch with your tutor and friends. Let's get connected",
                        index: 2, context:context),
                    AppOnboardingScreen(controller:_controller,
                        imagePath: pathBoy,
                        title: "Always Fascinated Learning",
                        subTitle:
                            "Anywhere, anytime. The time is at your discretion. So study wherever you can",
                        index: 3, context:context)
                  ],
                ),
                //for showing dots
                Positioned(
                  bottom: 100,
                  child: DotsIndicator(
                    position: index,
                    dotsCount: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                      size: const Size.square(9.0),
                      activeSize: const Size(24.0, 8.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                      )
                    ),
                  ),

                ),
              ],
            ),
          ),
        ),
      ),
    )
    );
  }
}