import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart'; // For HTML parsing

class GutenbergService {
  static const String baseUrl = 'https://www.gutenberg.org/';

  Future<List<Map<String, String>>> searchBooks(String query) async {
    final url = Uri.parse('$baseUrl/ebooks/search/?query=${Uri.encodeComponent(query)}');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var document = parse(response.body);
      var books = document.getElementsByClassName('booklink');
      
      List<Map<String, String>> bookList = [];
      for (var book in books) {
        var titleElement = book.querySelector('.title');
        var linkElement = book.querySelector('a');

        if (titleElement != null && linkElement != null) {
          String title = titleElement.text.trim();
          String link = baseUrl + linkElement.attributes['href']!;
          bookList.add({'title': title, 'link': link});
        }
      }

      return bookList;
    } else {
      throw Exception('Failed to load books from Project Gutenberg');
    }
  }
}
