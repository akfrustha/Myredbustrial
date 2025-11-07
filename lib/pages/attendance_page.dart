import 'package:flutter/material.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    final attendance = [
      {'subject': 'Iss', 'present': 22, 'total': 25},
      {'subject': 'Cloud', 'present': 23, 'total': 25},
      {'subject': 'Programming', 'present': 25, 'total': 25},
      {'subject': 'Database Systems', 'present': 14, 'total': 25},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Attendance")),
      body: ListView.builder(
        itemCount: attendance.length,
        itemBuilder: (context, index) {
          final subject = attendance[index];
          final int present = subject['present'] as int;
          final int total = subject['total'] as int;
          double percent = (present / total) * 100;
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(subject['subject'] as String),
              subtitle: Text('Present: ${present}/${total}'),
              trailing: Text('${percent.toStringAsFixed(1)}%', style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
          );
        },
      ),
    );
  }
}
