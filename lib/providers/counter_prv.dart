import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_prv.g.dart';

@riverpod
class CounterNotifier extends _$CounterNotifier {
  @override
  int build() => 0;

  DoIncrease() => state++;
  
  DoDecrease() => state--;
}
