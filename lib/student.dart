import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:myredbustrial/auma.dart';
import 'package:myredbustrial/student2.dart';
import 'package:myredbustrial/student3.dart';

class StudentPage extends StatelessWidget {
  const StudentPage({super.key});

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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 161, 158, 158),
         title: SizedBox(
          height: 30,
          child: Marquee(
      text: '🎓 Marjan Ladies College (STR) ',
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
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
       
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 176, 178, 180),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Image.asset('images/nasriya.jpg', width: 80, height: 80),
                 // const Icon(Icons.person, size: 80, color: Colors.white),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "SID: 199902MBCS0",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Fathima",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text("1st Year",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 219, 214, 214))),
                          SizedBox(width: 40),
                          Text("Technology",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 211, 207, 207))),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Marquee / Slider section
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: StudentMarqueePage(),
            ),
            const SizedBox(height: 4),
           // const Padding(
     // padding: const EdgeInsets.all(10.0),
      //child:
       GridView.builder(
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
              shadowColor: const Color.fromARGB(255, 63, 63, 63),
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
    //);
            const Text(
              "Thank you for using our app1",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

             const SizedBox(height: 4),
            const Text(
              "Thank you for using our app2",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

             const SizedBox(height: 4),
            const Text(
              "Thank you for using our app3",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

             const SizedBox(height: 4),
            const Text(
              "Thank you for using our app4",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

             const SizedBox(height: 4),
            const Text(
              "Thank you for using our app5",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

             const SizedBox(height: 4),
            const Text(
              "Thank you for using our app6",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

             const SizedBox(height: 4),
            const Text(
              "Thank you for using our app7",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

             const SizedBox(height: 4),
            const Text(
              "Thank you for using our app8",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              "Thank you for using our app9",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

             const SizedBox(height: 4),
            const Text(
              "Thank you for using our app10",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

             const SizedBox(height: 4),
            const Text(
              "Thank you for using our app11",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

             const SizedBox(height: 4),
            const Text(
              "Thank you for using our app12",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

             const SizedBox(height: 4),
            const Text(
              "Thank you for using our app13",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

             const SizedBox(height: 4),
            const Text(
              "Thank you for using our app14",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

             const SizedBox(height: 4),
            const Text(
              "Thank you for using our app15",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

             const SizedBox(height: 4),
            const Text(
              "Thank you for using our app16",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}
