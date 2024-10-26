import 'package:firebase_auth/firebase_auth.dart';
import 'package:flt_ulearning/common/global/global_loader.dart';
import 'package:flt_ulearning/common/widgets/popup_messages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/register_notifier.dart';
import '../repos/signup_repo.dart';

class SignupController {
  final WidgetRef ref;

  SignupController({required this.ref});

  Future<void> handleSignUp() async {
    var state = ref.read(registerNotifierProvider);
    var context = Navigator.of(ref.context);

    String name = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (state.userName.isEmpty || name.isEmpty) {
      toastInfo("Your name can not be empty");
      return;
    }

    if (state.email.length < 5 || email.length < 5) {
      toastInfo("Your name is too short");
      return;
    }

    if (state.email.isEmpty || email.isEmpty) {
      toastInfo("Your email can not be empty");
      return;
    }

    if ((password.length < 6)) {
      toastInfo("Your password is too short");
      return;
    }

    if ((state.password.isEmpty || state.rePassword.isEmpty)) {
      toastInfo("Your password can not be empty");
      return;
    }

    if ((state.password != state.rePassword) || (password != rePassword)) {
      toastInfo("Your password does not match");
      return;
    }

    //--Show loading:
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);

    try {
      // final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: state.password);
      final credential = await SignupRepo.firebaseSignup(email, password);

      if (kDebugMode) {
        print(credential);
      }
      if (credential.user != null) {
        await credential.user!.sendEmailVerification();
        await credential.user!.updateDisplayName(name);
        //--get server photo url
        String photoUrl = 'uploads/default.png';
        await credential.user!.updatePhotoURL(photoUrl);
        //--set user photo url
        toastInfo(
            'An email has been sent to verify your account. \nPlease check your email');
        context.pop();
      }
    } on FirebaseException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo('The password is too weak');
      } else if (e.code == 'email-already-in-use') {
        toastInfo('The account already exists for that email');
      } else if (e.code == 'user-not-found') {
        toastInfo('No user found for that email');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }

    //--Hide loading:
    ref.watch(appLoaderProvider.notifier).setLoaderValue(false);
  }
}
// FJwO06Nsl8gxuOoaI85VxaesouI3
