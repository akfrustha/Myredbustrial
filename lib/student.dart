import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:myredbustrial/auma.dart';
import 'package:myredbustrial/loginscreen.dart';
import 'package:myredbustrial/student2.dart';
import 'package:myredbustrial/student3.dart';

//featurers
import 'package:myredbustrial/pages/profile_page.dart';
import 'package:myredbustrial/pages/attendance_page.dart';
import 'package:myredbustrial/pages/timetable_page.dart';
import 'package:myredbustrial/pages/exam_page.dart';
import 'package:myredbustrial/pages/track_page.dart';
import 'package:myredbustrial/pages/apply_page.dart';
import 'package:myredbustrial/pages/library_page.dart';
import 'package:myredbustrial/pages/active_page.dart';

class StudentPage extends StatelessWidget {
  const StudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> features = [
  {'title': 'Profile', 'icon': Icons.person, 'page': const ProfilePage()},
  {'title': 'Attendance', 'icon': Icons.assignment_turned_in, 'page': const AttendancePage()},
  {'title': 'Timetable', 'icon': Icons.schedule, 'page': const TimetablePage()},
  {'title': 'Exam', 'icon': Icons.edit_note, 'page': const ExamPage()},
  {'title': 'Track Bus', 'icon': Icons.directions_bus, 'page': const TrackPage()},
  {'title': 'Apply Leave', 'icon': Icons.beach_access, 'page': const ApplyPage()},
  {'title': 'Library', 'icon': Icons.local_library, 'page': const LibraryPage()},
  {'title': 'Active Pages', 'icon': Icons.pages, 'page': const ActivePage()},
];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 105, 127, 139),
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
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.all(0),
            children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
              child: Text(
                ' Main Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Profile"),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              leading: const Icon(Icons.check_circle_outline),
              title: const Text("Attendance"),
              onTap: () {
                Navigator.pushNamed(context, '/attendance');
              },
            ),
            ListTile(
              leading: const Icon(Icons.schedule),
              title: const Text("Timetable"),
              onTap: () {
                Navigator.pushNamed(context, '/timetable');
              },
            ),

                ListTile(
              leading: const Icon(Icons.beach_access),
              title: const Text("Apply leave"),
              onTap: () {
                Navigator.pushNamed(context, '/app');
              },
            ),
                ListTile(
              leading: const Icon(Icons.directions_bus),
              title: const Text("TrackBus"),
              onTap: () {
                Navigator.pushNamed(context, '/track');
              },
            ),
                ListTile(
              leading: const Icon(Icons.pages),
              title: const Text("Active page"),
              onTap: () {
                Navigator.pushNamed(context, '/active');
              },
            ),
                ListTile(
              leading: const Icon(Icons.local_library),
              title: const Text("Library"),
              onTap: () {
                Navigator.pushNamed(context, '/library');
              },
            ),
            
            const Divider(),
            // ListTile(
            //   leading: const Icon(Icons.logout),
            //   title: const Text("Logout"),
            //   onTap: () {
            //     Navigator.pop(context);
            //   },
            // ),
            //   ListTile(
            //     leading: const Icon(Icons.home),
            //     title: const Text('Home'),
            //     onTap: () {
            //       Navigator.pop(context);
            //     },
            //   ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
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
                color:  Colors.blueGrey,
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
        padding: const EdgeInsets.all(10),
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

              Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => features[index]['page']),
  );

              // TODO: Add navigation for each feature page
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${features[index]['title']} clicked')),
              );
            },
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.white,
              shadowColor: const Color.fromARGB(255, 63, 63, 63),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    features[index]['icon'],
                    size: 50,
                    color:  Colors.blueGrey,
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
