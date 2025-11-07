import 'package:flutter/material.dart';

class ApplyPage extends StatelessWidget {
  const ApplyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final reasonController = TextEditingController();
    final daysController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Apply Leave")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: reasonController,
              decoration: const InputDecoration(labelText: "Reason for Leave"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: daysController,
              decoration: const InputDecoration(labelText: "Number of Days"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Leave request submitted")),
                );
              },
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
