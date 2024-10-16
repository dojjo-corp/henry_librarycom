// ignore: unused_import
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:librarycom/services/library_api/gutenberg_service.dart';
import 'package:librarycom/ui/components/my_drawer.dart';
import 'package:librarycom/utils/global_methods.dart';
// import 'package:librarycom/services/library_api/gutenberg_service.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late final TextEditingController searchController;
  String searchedTerm = "";
  List<Map<String, dynamic>> searchResults = [];

  bool _isLoading = false;

  _getBooks(String searchTerm) async {
    try {
      final gutenberg = GutenbergService();
      final searchedBooks = await gutenberg.searchBooks(searchTerm);

      if (mounted) {
        setState(() {
          searchResults = searchedBooks;
        });
      }
    } catch (e) {
      if (mounted) {
        showSnackBar(
          context,
          "Error making query: ${e.toString()}",
        );
      }
    }
  }

  clearSearch() {
    setState(() {
      searchResults.clear();
      searchController.clear();
    });
  }
  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _isLoading ? const LinearProgressIndicator() : null,
      drawer: const MyDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: TextFormField(
          controller: searchController,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: Colors.white70,
              suffixIcon: IconButton(
                  onPressed: clearSearch,
                  icon: const Icon(
                    Icons.clear_rounded,
                    color: Color.fromARGB(255, 220, 158, 158),
                  ))),
          onChanged: (String? value) {
            if (value == null) return;
            _getBooks(value);
          },
        ),
      ),
      body: GridView.builder(
        itemCount: searchResults.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: MediaQuery.sizeOf(context).width * 0.5,
        ),
        itemBuilder: (context, index) {
          final book = searchResults[index];

          return ListTile(
            leading: Icon(
              Icons.menu_book_rounded,
              color: Theme.of(context).primaryColor.withOpacity(0.6),
            ),
            title: Text(
              book["title"],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              book["link"],
              style: TextStyle(
                color: Colors.grey[800]!,
              ),
            ),
          );
        },
      ),
    );
  }
}
