import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:librarycom/models/user_model.dart';

class Firestore {
  static final store = FirebaseFirestore.instance;
  
  Future<void> createUserDoc({
    required String email,
    required String username,
    required String emoteURL,
  }) async {
    try {
      final ref = store.collection("All Users").doc();
      final userModel = UserModel(
          id: ref.id, email: email, username: username, emoteURL: emoteURL);

      ref.set(userModel.toMap());
    } catch (e) {
      rethrow;
    }
  }
}
