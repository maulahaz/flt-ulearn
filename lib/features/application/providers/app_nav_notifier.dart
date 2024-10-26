import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_nav_notifier.g.dart';

@riverpod
class ApplicationNavNotifier extends _$ApplicationNavNotifier {
  @override
  int build() => 0;

  void changeNavIndex(int val) {
    state = val;
  }
}
