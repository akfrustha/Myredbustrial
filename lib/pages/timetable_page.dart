import 'package:flutter/material.dart';

class TimetablePage extends StatelessWidget {
  const TimetablePage({super.key});

  @override
  Widget build(BuildContext context) {
    final timetable = [
      {'day': 'Monday', 'subject': 'Mathematics', 'time': '8:30 - 10:00 AM'},
      {'day': 'Tuesday', 'subject': 'Physics', 'time': '9:00 - 10:30 AM'},
      {'day': 'Wednesday', 'subject': 'Programming', 'time': '10:30 - 12:00 PM'},
      {'day': 'Thursday', 'subject': 'Database Systems', 'time': '8:30 - 10:00 AM'},
      {'day': 'Friday', 'subject': 'Project Lab', 'time': '9:00 - 11:00 AM'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Timetable")),
      body: ListView.builder(
        itemCount: timetable.length,
        itemBuilder: (context, index) {
          final t = timetable[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(t['day']!),
              subtitle: Text('${t['subject']} - ${t['time']}'),
            ),
          );
        },
      ),
    );
  }
}
