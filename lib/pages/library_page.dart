import 'package:flutter/material.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final books = [
      {'title': 'Data Structures', 'author': 'Mark Weiss', 'status': 'Issued'},
      {'title': 'Operating Systems', 'author': 'Silberschatz', 'status': 'Available'},
      {'title': 'Database Design', 'author': 'Elmasri', 'status': 'Issued'},
      {'title': 'Python Basics', 'author': 'John Zelle', 'status': 'Available'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Library")),
      body: ListView(
        children: books.map((book) {
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(book['title']!),
              subtitle: Text("Author: ${book['author']}"),
              trailing: Text(book['status']!,
                  style: TextStyle(
                      color: book['status'] == 'Available'
                          ? Colors.green
                          : Colors.red,
                      fontWeight: FontWeight.bold)),
            ),
          );
        }).toList(),
      ),
    );
  }
}
