import 'package:flutter/material.dart';

class BookTile extends StatefulWidget {
  const BookTile({super.key, required this.bookId});

  final String bookId;

  @override
  State<BookTile> createState() => _BookTileState();
}

class _BookTileState extends State<BookTile> {

  bool _isLoading = false;

  getBookDetails() async {
    try {
      
    } catch (e) {
      
    }
  }
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.menu_book_rounded,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
