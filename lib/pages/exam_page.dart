import 'package:flutter/material.dart';

class ExamPage extends StatelessWidget {
  const ExamPage({super.key});

  @override
  Widget build(BuildContext context) {
    final exams = [
      {'subject': 'Mathematics', 'date': '2025-11-20', 'time': '9:00 AM - 11:00 AM', 'hall': 'A1'},
      {'subject': 'Physics', 'date': '2025-11-22', 'time': '9:00 AM - 11:00 AM', 'hall': 'A2'},
      {'subject': 'Programming', 'date': '2025-11-25', 'time': '1:00 PM - 3:00 PM', 'hall': 'Lab 3'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Exam Schedule")),
      body: ListView(
        children: exams.map((exam) {
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(exam['subject']!),
              subtitle: Text('Date: ${exam['date']}\nTime: ${exam['time']}\nHall: ${exam['hall']}'),
            ),
          );
        }).toList(),
      ),
    );
  }
}
