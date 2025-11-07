import 'package:flutter/material.dart';

class ApplyPage extends StatefulWidget {
  const ApplyPage({super.key});

  @override
  State<ApplyPage> createState() => _ApplyPageState();
}

class _ApplyPageState extends State<ApplyPage> {
  final TextEditingController reasonController = TextEditingController();
  final TextEditingController daysController = TextEditingController();
  DateTime? fromDate;
  DateTime? toDate;

  Future<void> _selectDate(BuildContext context, bool isFromDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        if (isFromDate) {
          fromDate = picked;
        } else {
          toDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Apply Leave")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: reasonController,
                decoration: const InputDecoration(
                  labelText: "Reason for Leave",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: daysController,
                decoration: const InputDecoration(
                  labelText: "Number of Days",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 15),
              // From Date
              Row(
                children: [
                  Expanded(
                    child: Text(
                      fromDate == null
                          ? "From Date: Not selected"
                          : "From Date: ${fromDate!.day}/${fromDate!.month}/${fromDate!.year}",
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _selectDate(context, true),
                    child: const Text("Select"),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // To Date
              Row(
                children: [
                  Expanded(
                    child: Text(
                      toDate == null
                          ? "To Date: Not selected"
                          : "To Date: ${toDate!.day}/${toDate!.month}/${toDate!.year}",
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _selectDate(context, false),
                    child: const Text("Select"),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                onPressed: () {
                  if (reasonController.text.isEmpty ||
                      daysController.text.isEmpty ||
                      fromDate == null ||
                      toDate == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please fill all fields and select dates"),
                      ),
                    );
                    return;
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Leave request submitted successfully!"),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
                child: const Text("Submit"),
              ),


               ElevatedButton(
                onPressed: () {
                  reasonController.clear();
                  daysController.clear();
                  setState(() {
                    fromDate = null;
                    toDate = null;
                  });
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                 // backgroundColor: Colors.white,
                ),
                child: const Text("Clear"),
              ),

                ],
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
