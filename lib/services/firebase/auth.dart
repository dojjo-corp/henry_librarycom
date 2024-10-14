import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  static final auth = FirebaseAuth.instance;

  Future<void> login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> register(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> resetPassword(String resetEmail) async {
    try {
      await auth.sendPasswordResetEmail(email: resetEmail);
    } catch (e) {
      rethrow;
    }
  }
}
