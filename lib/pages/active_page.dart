import 'package:flutter/material.dart';

class ActivePage extends StatefulWidget {
  const ActivePage({super.key});

  @override
  State<ActivePage> createState() => _ActivePageState();
}

class _ActivePageState extends State<ActivePage> {
  List<Map<String, String>> activities = [
    {'activity': 'Submitted Assignment 1', 'date': '2025-11-01'},
    {'activity': 'Bus Fee Paid', 'date': '2025-10-28'},
    {'activity': 'Attended Programming Workshop', 'date': '2025-10-25'},
    {'activity': 'Library Book Returned', 'date': '2025-10-20'},
  ];

  final TextEditingController activityController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  // Show dialog for Add/Edit
  void _showActivityDialog({Map<String, String>? activity, int? index}) {
    if (activity != null) {
      // Editing existing
      activityController.text = activity['activity']!;
      dateController.text = activity['date']!;
    } else {
      // Adding new
      activityController.clear();
      dateController.clear();
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(activity == null ? 'Add Activity' : 'Edit Activity'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: activityController,
              decoration: const InputDecoration(labelText: 'Activity'),
            ),
            TextField(
              controller: dateController,
              decoration: const InputDecoration(labelText: 'Date (YYYY-MM-DD)'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (activityController.text.isEmpty || dateController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please fill all fields')),
                );
                return;
              }

              setState(() {
                if (activity == null) {
                  // Add new
                  activities.add({
                    'activity': activityController.text,
                    'date': dateController.text,
                  });
                } else {
                  // Edit existing
                  activities[index!] = {
                    'activity': activityController.text,
                    'date': dateController.text,
                  };
                }
              });

              Navigator.pop(context);
            },
            child: Text(activity == null ? 'Add' : 'Save'),
          ),
        ],
      ),
    );
  }

  // Delete confirmation
  void _deleteActivity(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Activity'),
        content: Text(
            'Are you sure you want to delete "${activities[index]['activity']}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                activities.removeAt(index);
              });
              Navigator.pop(context);
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Active Page (Editable)"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showActivityDialog(),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: activities.length,
        itemBuilder: (context, index) {
          final a = activities[index];
          return Card(
            margin: const EdgeInsets.all(8),
            elevation: 3,
            child: ListTile(
              leading: const Icon(Icons.check_circle, color: Colors.blue),
              title: Text(
                a['activity']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Date: ${a['date']}"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.orange),
                    onPressed: () => _showActivityDialog(activity: a, index: index),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteActivity(index),
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
