import 'package:flutter/material.dart';
import 'package:librarycom/ui/components/back_button.dart';
import 'package:librarycom/ui/components/my_drawer.dart';
// import 'package:librarycom/services/library_api/gutenberg_service.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late final TextEditingController searchController;
  String searchedTerm = "";

  bool _isLoading = false;

  _getBooks(String searchTerm) {}
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
          ),
          onChanged: (String? value) {
            if (value == null) return;
            setState(() {
              searchedTerm = value;
            });
          },
        ),
      ),
      body: Center(
        child: Text("You searced for: $searchedTerm"),
      ),
    );
  }
}
