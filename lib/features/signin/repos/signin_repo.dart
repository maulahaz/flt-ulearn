import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flt_ulearning/common/models/user.dart';
import 'package:flt_ulearning/common/services/http_util.dart';

class SigninRepo {
  static Future<UserCredential> firebaseSignin(
      String email, String password) async {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return credential;
  }

  static Future<UserLoginResponseEntity> login(
      {UserLoginRequestEntity? param}) async {
    print('----Param are: ');
    print(jsonEncode(param));
    var response = await HttpUtil().post(
      "auth/login",
      queryParameters: param?.toJson(),
    );
    return UserLoginResponseEntity.fromJson(response);
  }
}
