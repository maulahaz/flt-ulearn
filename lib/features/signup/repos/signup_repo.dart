import 'package:firebase_auth/firebase_auth.dart';

class SignupRepo {
  static Future<UserCredential> firebaseSignup(
      String email, String password) async {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return credential;
  }
}
