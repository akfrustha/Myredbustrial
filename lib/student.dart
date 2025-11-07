import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:myredbustrial/auma.dart';
import 'package:myredbustrial/loginscreen.dart';
import 'package:myredbustrial/student2.dart';
import 'package:myredbustrial/student3.dart';
import 'data_manager.dart';

// feature pages
import 'package:myredbustrial/pages/profile_page.dart';
import 'package:myredbustrial/pages/attendance_page.dart';
import 'package:myredbustrial/pages/timetable_page.dart';
import 'package:myredbustrial/pages/exam_page.dart';
import 'package:myredbustrial/pages/track_page.dart';
import 'package:myredbustrial/pages/apply_page.dart';
import 'package:myredbustrial/pages/library_page.dart';
import 'package:myredbustrial/pages/active_page.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {

  int _selectedIndex = 0; // 🔹 To track selected bottom item
  int notificationCount = 0;
  // Editable student info fields
  String sid = "199902MBCS0";
  String name = "Fathima";
  String year = "1st Year";
  String department = "Technology";

  bool isEditing = false;

  final sidController = TextEditingController();
  final nameController = TextEditingController();
  final yearController = TextEditingController();
  final deptController = TextEditingController();

  @override
  void initState() {
    super.initState();
    sidController.text = sid;
    nameController.text = name;
    yearController.text = year;
    deptController.text = department;

    
  // 🔹 Register listener for real-time updates
  DataManager().registerListener(_onDataUpdated);
  }

  void _onDataUpdated() {
  setState(() {
    notificationCount = DataManager().notifications.length;
  });
}


final List<Widget> _pages = [
    const Center(child: Text("🏠 Home Page", style: TextStyle(fontSize: 18))),
    const Center(child: Text("⚙️ Settings Page", style: TextStyle(fontSize: 18))),
  ];

  @override
  void dispose() {
     DataManager().unregisterListener(_onDataUpdated);
    sidController.dispose();
    nameController.dispose();
    yearController.dispose();
    deptController.dispose();
    super.dispose();
  }
//-- 🔹 Bottom Navigation Tap Handler

void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // 🔹 Example actions when each item is tapped
    if (index == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("You’re on Home Page")),
      );
    } else if (index == 1) {
      _showSettingsDialog();
    }
  }

  void _showSettingsDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Settings"),
        content: const Text("This is the settings page for students."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }


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
         Stack(
  children: [
    IconButton(
      icon: const Icon(Icons.notifications, color: Colors.white),
      onPressed: () {
        _showNotifications(context);
      },
    ),
    if (notificationCount > 0)
      Positioned(
        right: 8,
        top: 8,
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
          ),
          child: Text(
            '$notificationCount',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
  ],
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
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blueGrey),
              child: Text(
                'Main Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Profile"),
              onTap: () => Navigator.pushNamed(context, '/profile'),
            ),
            ListTile(
              leading: const Icon(Icons.check_circle_outline),
              title: const Text("Attendance"),
              onTap: () => Navigator.pushNamed(context, '/attendance'),
            ),
            ListTile(
              leading: const Icon(Icons.schedule),
              title: const Text("Timetable"),
              onTap: () => Navigator.pushNamed(context, '/timetable'),
            ),
            ListTile(
              leading: const Icon(Icons.beach_access),
              title: const Text("Apply Leave"),
              onTap: () => Navigator.pushNamed(context, '/app'),
            ),
            ListTile(
              leading: const Icon(Icons.directions_bus),
              title: const Text("Track Bus"),
              onTap: () => Navigator.pushNamed(context, '/track'),
            ),
            ListTile(
              leading: const Icon(Icons.pages),
              title: const Text("Active Page"),
              onTap: () => Navigator.pushNamed(context, '/active'),
            ),
            ListTile(
              leading: const Icon(Icons.local_library),
              title: const Text("Library"),
              onTap: () => Navigator.pushNamed(context, '/library'),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),

            // 🧠 Editable Student Info Card
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Image.asset('images/nasriya.jpg', width: 80, height: 80),
                  const SizedBox(width: 12),
                  Expanded(
                    child: isEditing
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextField(
                                controller: sidController,
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                  labelText: "SID",
                                  labelStyle: TextStyle(color: Colors.white),
                                ),
                              ),
                              TextField(
                                controller: nameController,
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                  labelText: "Name",
                                  labelStyle: TextStyle(color: Colors.white),
                                ),
                              ),
                              TextField(
                                controller: yearController,
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                  labelText: "Year",
                                  labelStyle: TextStyle(color: Colors.white),
                                ),
                              ),
                              TextField(
                                controller: deptController,
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                  labelText: "Department",
                                  labelStyle: TextStyle(color: Colors.white),
                                ),
                              ),
                              const SizedBox(height: 6),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black54,
                                ),
                                onPressed: () {
                                  setState(() {
                                    sid = sidController.text;
                                    name = nameController.text;
                                    year = yearController.text;
                                    department = deptController.text;
                                    isEditing = false;
                                  });
                                },
                                child: const Text("Save"),
                              ),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "SID: $sid",
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                name,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(year,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 219, 214, 214))),
                                  const SizedBox(width: 40),
                                  Text(department,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 211, 207, 207))),
                                ],
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  icon: const Icon(Icons.edit, color: Colors.white),
                                  onPressed: () {
                                    setState(() {
                                      isEditing = true;
                                    });
                                  },
                                ),
                              )
                            ],
                          ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            const Padding(
              padding: EdgeInsets.all(8.0),
              child: StudentMarqueePage(),
            ),
            const SizedBox(height: 4),

            // Grid menu
            GridView.builder(
              padding: const EdgeInsets.all(10),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: features.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => features[index]['page']),
                    );
                  },
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    color: Colors.white,
                    shadowColor: const Color.fromARGB(255, 63, 63, 63),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(features[index]['icon'], size: 50, color: Colors.blueGrey),
                        const SizedBox(height: 10),
                        Text(features[index]['title'],
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 10),
            const Text("Thank you for using our app!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}


void _showNotifications(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Notifications"),
        content: DataManager().notifications.isEmpty
            ? const Text("No new notifications.")
            : SizedBox(
                width: double.maxFinite,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: DataManager().notifications.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const Icon(Icons.campaign, color: Colors.blue),
                      title: Text(DataManager().notifications[index]),
                    );
                  },
                ),
              ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ],
      );
    },
  );
}
