import 'package:flutter/material.dart';

class StudentTwo extends StatelessWidget {
  const StudentTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> features = [
      {'title': 'Profile', 'icon': Icons.person},
      {'title': 'Attendance', 'icon': Icons.assignment_turned_in},
      {'title': 'Timetable', 'icon': Icons.schedule},
      {'title': 'Exam', 'icon': Icons.edit_note},
      {'title': 'Track Bus', 'icon': Icons.directions_bus},
      {'title': 'Apply Leave', 'icon': Icons.beach_access},
      {'title': 'Library', 'icon': Icons.local_library},
      {'title': 'Active Pages', 'icon': Icons.pages},
    ];

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(), // disables inner scroll
        shrinkWrap: true, // fits inside parent scroll
        itemCount: features.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 cards per row
          crossAxisSpacing: 05,
          mainAxisSpacing: 05,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // TODO: Add navigation for each feature page
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${features[index]['title']} clicked')),
              );
            },
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: Colors.white,
              shadowColor: Colors.blueAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    features[index]['icon'],
                    size: 50,
                    color: Colors.blueAccent,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    features[index]['title'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
