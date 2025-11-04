// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';

// class StudentMarqueePage extends StatelessWidget {
//   const StudentMarqueePage({super.key});

//   final List<String> cardTexts = const [
//     "Welcome Students!",
//     "Get 30% Discounted Bus Tickets",
//     "Train Tickets Available",
//     "Course Offers(C,C++,Java,Python)",
//     "Check Your Schedule Now",
//   ];

//   final List<Color> myimage =  [
//     Image.asset(name),
//      Image.asset(name),
//       Image.asset(name),
//        Image.asset(name),
//         Image.asset(name),
    
//     // Color.fromARGB(255, 25, 3, 3),
//     // Color.fromARGB(255, 99, 99, 100),
//     // Color.fromARGB(255, 2, 120, 6),
//     // Color.fromARGB(255, 123, 75, 3),
//     // Color.fromARGB(255, 96, 3, 112),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return CarouselSlider.builder(
//       itemCount: cardTexts.length,
//       itemBuilder: (context, index, realIndex) {
//         return _buildCard(cardTexts[index], myimage[index % myimage.length]);
//       },
//       options: CarouselOptions(
//         height: 140,
//         autoPlay: true,
//         autoPlayInterval: const Duration(seconds: 2),
//         enlargeCenterPage: true,
//         viewportFraction: 0.7,
//       ),
//     );
//   }

//   Widget _buildCard(String text, Color color) {
//     return Card(
//       elevation: 8,
//       color: color,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       child: Container(
//         width: double.infinity,
//         padding: const EdgeInsets.all(16),
//         child: Column(
//          // mainAxisAlignment: MainAxisAlignment.center,
//         //  crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const Icon(Icons.school, size: 40, color: Colors.white),
//             const SizedBox(height: 12),
//             Text(
//               text,
//               textAlign: TextAlign.center,
//               style: const TextStyle(
//                 fontSize: 18,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class StudentMarqueePage extends StatelessWidget {
  const StudentMarqueePage({super.key});

  final List<String> cardTexts = const [
    "Welcome Students!",
    "Get 30% Discounted Bus Tickets",
    "Train Tickets Available",
    "Course Offers (C, C++, Java, Python)",
    "Check Your Schedule Now",
  ];

  final List<String> imagePaths = const [
    'images/images1.jpg',
    'images/images2.jpg',
    'images/images3.png',
    'images/images4.jpg',
    'images/images5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: cardTexts.length,
      itemBuilder: (context, index, realIndex) {
        return _buildCard(cardTexts[index], imagePaths[index % imagePaths.length]);
      },
      options: CarouselOptions(
        height: 140,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 2),
        enlargeCenterPage: true,
        viewportFraction: 0.8,
      ),
    );
  }

  Widget _buildCard(String text, String imagePath) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(imagePath, fit: BoxFit.cover),
          Container(
            color: Colors.black45,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


