import 'package:cloud_firestore/cloud_firestore.dart';

class BookModel {
  final String topic;
  final String author;
  List<String> openLinks;

  BookModel({
    required this.topic,
    required this.author,
    required this.openLinks,
  });

  Map<String, dynamic> toMap() => {
        "topic": topic,
        "author": author,
        "openLinks": openLinks,
      };

  factory BookModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();

    return BookModel(
      topic: data?["topic"],
      author: data?["author"],
      openLinks: data?["openLinks"],
    );
  }
}
