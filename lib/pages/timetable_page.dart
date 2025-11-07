import 'package:flutter/material.dart';

class TimetablePage extends StatelessWidget {
  const TimetablePage({super.key});

  @override
  Widget build(BuildContext context) {
    final timetable = [
      {
        'day': 'Monday',
        'subject': 'ADMS',
        'time': '8:30 - 10:30 AM',
        'subject2': 'Cloud',
        'time2': '10:30 - 12:30 AM'
      },
      {
        'day': 'Tuesday',
        'subject': 'ASE',
        'time': '9:00 - 10:30 AM',
        'subject2': 'CloudPr..',
        'time2': '1:30 - 3:30 AM'
      },
      {
        'day': 'Wednesday',
        'subject': 'Programming',
        'time': '10:30 - 12:00 PM',
        'subject2': 'Risk',
        'time2': '10:30 - 12:30 AM'
      },
      {
        'day': 'Thursday',
        'subject': 'Database Systems',
        'time': '8:30 - 10:00 AM',
        'subject2': 'SOWA',
        'time2': '3:00 - 4:30 AM'
      },
      {
        'day': 'Friday',
        'subject': 'IMK',
        'time': '9:00 - 11:00 AM',
        'subject2': 'ISS',
        'time2': '10:30 - 12:30 AM'
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Timetable")),
      body: ListView.builder(
        itemCount: timetable.length,
        itemBuilder: (context, index) {
          final t = timetable[index];
          return Card(
            margin: const EdgeInsets.all(8),
            elevation: 4,
            child: ListTile(
              title: Text(
                t['day']!,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${t['subject']} - ${t['time']}'),
                  Text('${t['subject2']} - ${t['time2']}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
