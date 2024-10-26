import 'package:dots_indicator/dots_indicator.dart';
import 'package:flt_ulearning/common/utils/image_res.dart';
import 'package:flt_ulearning/features/welcome/providers/welcome_notifier.dart';
import 'package:flt_ulearning/features/welcome/views/widgets/welcome_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final indexProvider = StateProvider<int>((ref) => 0);

class Welcome extends ConsumerWidget {
  Welcome({super.key});

  final PageController _controller = PageController();

  // int dotsIndex = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final index = ref.watch(indexProvider);
    final index = ref.watch(indexDotProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            margin: const EdgeInsets.only(top: 30.0),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (value) {
                    print('== My Index value is $value');
                    // dotsIndex = value;
                    // ref.read(indexProvider.notifier).state = value;
                    ref.read(indexDotProvider.notifier).changeIndex(value);
                  },
                  children: [
                    appOnboardingPage(context, _controller,
                        imagePath: ImageRes.reading,
                        title: "First See Learning",
                        subtitle:
                            "Forget about of paper all knowledge in one learning",
                        index: 1),
                    appOnboardingPage(context, _controller,
                        imagePath: ImageRes.man,
                        title: "Connect With Everyone",
                        subtitle:
                            "Always keep in touch with your tutor and friends. Let's get connected",
                        index: 2),
                    appOnboardingPage(context, _controller,
                        imagePath: ImageRes.boy,
                        title: "Always Fascinated Learning",
                        subtitle:
                            "Anywhere, anytime. The time is at your discretion. So study wherever you can",
                        index: 3),
                  ],
                ),
                Positioned(
                  bottom: 30,
                  child: DotsIndicator(
                    position: index,
                    dotsCount: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                        size: const Size.square(9.0),
                        activeSize: const Size(24.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
