import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'loginscreen.dart';
import 'data_manager.dart';


class TeacherPage extends StatefulWidget {
  const TeacherPage({super.key});

  @override
  State<TeacherPage> createState() => _TeacherPageState();
}

class _TeacherPageState extends State<TeacherPage> {
  List<Map<String, dynamic>> modules = [
    {
      'title': 'Introduction to Programming',
      'description': 'Learn the basics of programming concepts',
      'questions': 40,
      'assignments': 1,
      'materials': 2,
      'active': true,
    },
    {
      'title': 'Data Structures',
      'description': 'Understanding arrays, lists, and trees',
      'questions': 25,
      'assignments': 0,
      'materials': 1,
      'active': false,
    },
  ];

  void _toggleActive(int index) {
    setState(() {
      modules[index]['active'] = !modules[index]['active'];
    });
  }

  void _showEditDialog({Map<String, dynamic>? existing, int? index}) {
    final titleController =
        TextEditingController(text: existing?['title'] ?? '');
    final descriptionController =
        TextEditingController(text: existing?['description'] ?? '');
    final questionsController = TextEditingController(
        text: existing?['questions']?.toString() ?? '0');
    final assignmentsController = TextEditingController(
        text: existing?['assignments']?.toString() ?? '0');
    final materialsController = TextEditingController(
        text: existing?['materials']?.toString() ?? '0');
    bool active = existing?['active'] ?? false;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(existing == null ? 'Create Module' : 'Edit Module'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                ),
                TextField(
                  controller: questionsController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Questions'),
                ),
                TextField(
                  controller: assignmentsController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Assignments'),
                ),
                TextField(
                  controller: materialsController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Materials'),
                ),
                SwitchListTile(
                  title: const Text("Active"),
                  value: active,
                  onChanged: (val) {
                    setState(() {
                      active = val;
                    });
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel")),
            ElevatedButton(
              onPressed: () {
                final newModule = {
                  'title': titleController.text,
                  'description': descriptionController.text,
                  'questions': int.tryParse(questionsController.text) ?? 0,
                  'assignments': int.tryParse(assignmentsController.text) ?? 0,
                  'materials': int.tryParse(materialsController.text) ?? 0,
                  'active': active,
                };

                setState(() {
                  if (existing == null) {
                    modules.add(newModule);
                   DataManager().addModule(newModule); // 🔹 Share it globally

                  } else {
                    modules[index!] = newModule;
                  }
                });
                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  void _deleteModule(int index) {
    setState(() {
      modules.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: SizedBox(
          height: 30,
          child: Marquee(
            text: ' Marjan Ladies College (STR) ',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            velocity: 40.0,
            blankSpace: 50.0,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome Teacher!\n\nCourse Modules",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              "Manage your course content and materials",
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                itemCount: modules.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 270,
                  crossAxisSpacing: 40,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  final module = modules[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  module['title'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              PopupMenuButton<String>(
                                onSelected: (value) {
                                  if (value == 'edit') {
                                    _showEditDialog(
                                        existing: module, index: index);
                                  } else if (value == 'delete') {
                                    _deleteModule(index);
                                  }
                                },
                                itemBuilder: (context) => [
                                  const PopupMenuItem(
                                    value: 'edit',
                                    child: Text('Edit'),
                                  ),
                                  const PopupMenuItem(
                                    value: 'delete',
                                    child: Text('Delete'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            module['description'],
                            style: const TextStyle(color: Colors.black54),
                          ),
                          const Spacer(),
                          _buildStatRow("Questions", module['questions']),
                          _buildStatRow("Assignments", module['assignments']),
                          _buildStatRow("Materials", module['materials']),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () => _toggleActive(index),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: module['active']
                                  ? Colors.blue
                                  : Colors.grey[300],
                              foregroundColor: module['active']
                                  ? Colors.white
                                  : Colors.black,
                              minimumSize: const Size(double.infinity, 36),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child:
                                Text(module['active'] ? "Active" : "Inactive"),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showEditDialog(),
        icon: const Icon(Icons.add),
        label: const Text("Create Module"),
        backgroundColor: Colors.blue,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }

  Widget _buildStatRow(String label, int value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Chip(
          label: Text("$value"),
          backgroundColor: Colors.grey[200],
        ),
      ],
    );
  }
}
