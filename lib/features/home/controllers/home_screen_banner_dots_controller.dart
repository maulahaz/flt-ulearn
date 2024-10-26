import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home_screen_banner_dots_controller.g.dart';

@Riverpod(keepAlive: true)
class HomeScreenBannerDots extends _$HomeScreenBannerDots {
  @override
  int build() => 0;

  void setIndex(int value) {
    state = value;
  }
}
