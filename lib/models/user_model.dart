import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String email;
  String username;
  String? emoteURL;

  UserModel({required this.id,
    required this.email,
    required this.username,
    this.emoteURL,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "email": email,
      "username": username,
      "emoteURL": emoteURL ?? "",
    };
  }

  factory UserModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    
    return UserModel(
      id: data?["id"],
      email: data?["email"],
      username: data?["username"],
      emoteURL: data?["emoteURL"] ?? "",
    );
  }
}
