import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'welcome_ctrl.g.dart';

@riverpod
class IndexDot extends _$IndexDot{
  @override
  int build()=>0;

  void changeIndex(int value){
    state = value;
  }
}