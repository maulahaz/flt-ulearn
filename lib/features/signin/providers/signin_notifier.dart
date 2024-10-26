import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/signin_state.dart';

class SigninNotifier extends StateNotifier<SigninState> {
  SigninNotifier() : super(const SigninState());

  void onUserEmailChange(String email) {
    state = state.copyWith(email: email);
  }

  void onUserPasswordChange(String password) {
    state = state.copyWith(password: password);
  }
}

final signinNotifierProvider =
    StateNotifierProvider<SigninNotifier, SigninState>((ref) {
  return SigninNotifier();
});
