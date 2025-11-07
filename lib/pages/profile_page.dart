// import 'package:flutter/material.dart';

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Profile")),
//       body: const Center(
//         child: Text(
//           "Profile Page",
//           style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: const [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/nasriya.jpg'),
                ),
                SizedBox(height: 16),
                Text("Fathima Rustha", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                Text("SID: 199902MBCS0"),
                Text("Department: Technology"),
                Text("Year: 1st Year"),
                SizedBox(height: 16),
                Divider(),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text("076-1234567"),
                ),
                ListTile(
                  leading: Icon(Icons.email),
                  title: Text("fathima@example.com"),
                ),
                ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text("Colombo, Sri Lanka"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
