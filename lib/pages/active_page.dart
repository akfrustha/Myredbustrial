import 'package:flutter/material.dart';

class ActivePage extends StatelessWidget {
  const ActivePage({super.key});

  @override
  Widget build(BuildContext context) {
    final activities = [
      {'activity': 'Submitted Assignment 1', 'date': '2025-11-01'},
      {'activity': 'Bus Fee Paid', 'date': '2025-10-28'},
      {'activity': 'Attended Programming Workshop', 'date': '2025-10-25'},
      {'activity': 'Library Book Returned', 'date': '2025-10-20'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Active Page")),
      body: ListView(
        children: activities.map((a) {
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: const Icon(Icons.check_circle, color: Colors.blue),
              title: Text(a['activity']!),
              subtitle: Text("Date: ${a['date']}"),
            ),
          );
        }).toList(),
      ),
    );
  }
}
