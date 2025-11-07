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
       {'title': 'Java Programming', 'author': 'Herbert Schildt', 'status': 'Available'},
      {'title': 'Artificial Intelligence', 'author': 'Stuart Russell', 'status': 'Available'},
      {'title': 'Machine Learning', 'author': 'Tom Mitchell', 'status': 'Issued'},
      {'title': 'Cloud Computing', 'author': 'Rajkumar Buyya', 'status': 'Available'},
      {'title': 'Cyber Security', 'author': 'William Stallings', 'status': 'Issued'},
      {'title': 'Software Engineering', 'author': 'Ian Sommerville', 'status': 'Available'},
      {'title': 'Discrete Mathematics', 'author': 'Kenneth Rosen', 'status': 'Issued'},
      {'title': 'Web Development', 'author': 'Jon Duckett', 'status': 'Available'},
      {'title': 'C Programming', 'author': 'Dennis Ritchie', 'status': 'Issued'},
      {'title': 'Compiler Design', 'author': 'Alfred Aho', 'status': 'Available'},
      {'title': 'Data Mining', 'author': 'Han & Kamber', 'status': 'Issued'},
      {'title': 'Deep Learning', 'author': 'Ian Goodfellow', 'status': 'Available'},
      {'title': 'Big Data Analytics', 'author': 'Viktor Mayer-Schönberger', 'status': 'Issued'},
      {'title': 'IoT Fundamentals', 'author': 'David Hanes', 'status': 'Available'},
      {'title': 'Blockchain Basics', 'author': 'Daniel Drescher', 'status': 'Issued'},
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
