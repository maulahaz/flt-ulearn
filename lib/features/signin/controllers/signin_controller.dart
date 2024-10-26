import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flt_ulearning/common/models/user.dart';
import 'package:flt_ulearning/common/global/global_loader.dart';
import 'package:flt_ulearning/configs/keys.dart';
import 'package:flt_ulearning/global.dart';
import 'package:flt_ulearning/features/signin/repos/signin_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/widgets/popup_messages.dart';
import '../providers/signin_notifier.dart';

class SigninController {
  final WidgetRef ref;

  SigninController(this.ref);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> handleSignin() async {
    var state = ref.read(signinNotifierProvider);
    String email = state.email;
    String password = state.password;

    emailController.text = email;
    passwordController.text = password;

    if (state.email.isEmpty || email.isEmpty) {
      toastInfo("Your email can not be empty");
      return;
    }

    if ((state.password.isEmpty || password.isEmpty)) {
      toastInfo("Your password can not be empty");
      return;
    }

    //--Loading ON:
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);

    try {
      // final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

      final credential = await SigninRepo.firebaseSignin(email, password);

      if (credential.user == null) {
        toastInfo('User not found');
        return;
      } else if (!credential.user!.emailVerified) {
        toastInfo('You must verify your email first!');
        return;
      }

      var user = credential.user;
      if (user != null) {
        String? displayName = user.displayName;
        String? email = user.email;
        String? id = user.uid;
        String? photoURL = user.photoURL;

        UserLoginRequestEntity loginRequestEntity = UserLoginRequestEntity();
        loginRequestEntity.avatar = photoURL;
        loginRequestEntity.name = displayName;
        loginRequestEntity.email = email;
        loginRequestEntity.open_id = id;
        loginRequestEntity.type = 1;
        asyncPostAllData(loginRequestEntity);
      } else {
        toastInfo('Signin failed');
      }
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        toastInfo('User is not exist');
      } else if (e.code == 'wrong-password') {
        toastInfo('Password is not correct');
      } else if (e.code == 'invalid-credential') {
        toastInfo('Invalid credential');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    //--Loading OFF:
    ref.read(appLoaderProvider.notifier).setLoaderValue(false);
  }

  Future<void> asyncPostAllData(
      UserLoginRequestEntity loginRequestEntity) async {
    //
    var result = await SigninRepo.login(param: loginRequestEntity);
    print('---result');
    print(jsonEncode(result.data));
    if (result.code == 200) {
      //--Loading ON:
      // ref.read(appLoaderProvider.notifier).setLoaderValue(true);
      try {
        var nav = Navigator.of(ref.context);
        //
        Global.storageService
            .setString(STORAGE_USER_PROFILE_KEY, jsonEncode(result.data));
        Global.storageService
            .setString(STORAGE_USER_TOKEN_KEY, result.data!.access_token!);
        //
        //--pushNamedAndRemoveUntil : Tanpa ada tombol 'Back', Remove semua halaman
        nav.pushNamedAndRemoveUntil('/application', (route) => false);
      } catch (e) {
        print(e.toString());
      }
    } else {
      toastInfo('Login error');
    }

    //--Loading OFF:
    // ref.read(appLoaderProvider.notifier).setLoaderValue(false);
  }
}
