// import 'dart:convert';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:ulearning_app/common/global_loader/global_loader.dart';
// import 'package:ulearning_app/common/services/http_util.dart';
// import 'package:ulearning_app/features/sign_in/provider/sign_in_notifier.dart';
// import 'package:ulearning_app/features/sign_in/repo/sigin_in_repo.dart';
// import 'package:ulearning_app/main.dart';

// import '../../../common/models/user.dart';
// import '../../../common/services/utils/constants.dart';
// import '../../../common/widgets/popup_messages.dart';
// import '../../../global.dart';

// class SignInController {

//  // WidgetRef ref;

//   SignInController();

//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   Future<void> handleSignIn(WidgetRef ref) async {
//     var state = ref.watch(signInNotifierProvider);
//     String email = state.email;
//     String password = state.password;

//     emailController.text = email;
//     passwordController.text = password;


//     if (state.email.isEmpty || email.isEmpty) {
//       toastInfo("Your email is empty");
//       return;
//     }
//     if ((state.password.isEmpty) || password.isEmpty) {
//       toastInfo("Your password is empty");
//       return;
//     }
//     ref.read(appLoaderProvider.notifier).setLoaderValue(true);

//     try {

//       final credential = await SignInRepo.firebaseSignIn(email, password);


//       if(credential.user==null){
//         toastInfo("User not found");
//         return;
//       }

//       if(!credential.user!.emailVerified){
//         toastInfo("You must verify your email address first !");
//         return;
//       }
//       var user = credential.user;

//       if(user!=null){

//         String? displayName = user.displayName;
//         String? email = user.email;
//         String? id = user.uid;
//         String? photoUrl = user.photoURL;


//         LoginRequestEntity loginRequestEntity = LoginRequestEntity();
//         loginRequestEntity.avatar = photoUrl;
//         loginRequestEntity.name = displayName;
//         loginRequestEntity.email = email;
//         loginRequestEntity. open_id = id;
//         loginRequestEntity.type = 1;
//         asyncPostAllData(loginRequestEntity);
//         if (kDebugMode) {
//           print("user logged in");
//         }
//       }else{
//         toastInfo("login error");
//       }
//     }on FirebaseAuthException catch(e){
//       if(e.code=='user-not-found'){
//         toastInfo("User not found");
//       }else if(e.code=='wrong-password'){
//         toastInfo("Your password is wrong");
//       }


//     }catch(e){
//       if (kDebugMode) {
//         print(e.toString());
//       }
//     }

//     ref.read(appLoaderProvider.notifier).setLoaderValue(false);
//   }

//   void asyncPostAllData(LoginRequestEntity loginRequestEntity){

//    //we need to talk to server


//     //have local storage
//     try{
//       //try to remember user info
//       Global.storageService.setString(STORAGE_USER_PROFILE_KEY, jsonEncode({
//         'name':'dbestech', 'email':'info@dbestech.com', 'age':34
//       }));
//       Global.storageService.setString(STORAGE_USER_TOKEN_KEY, "123456");

//       navKey.currentState?.pushNamedAndRemoveUntil("/application", (route) => false);

//     }catch(e){
//       if (kDebugMode) {
//         print(e.toString());
//       }
//     }

//     //redirect to new page
//   }


// }