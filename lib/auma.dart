import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class StudentMarqueePage extends StatelessWidget {
  const StudentMarqueePage({super.key});

  final List<String> cardTexts = const [
    "Welcome Students!",
    "Get Discounted Bus Tickets",
    "Train Tickets Available",
    "Special Hotel Offers",
    "Check Your Schedule",
  ];

  final List<Color> colors = const [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: cardTexts.length,
      itemBuilder: (context, index, realIndex) {
        return _buildCard(cardTexts[index], colors[index % colors.length]);
      },
      options: CarouselOptions(
        height: 180,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 1),
        enlargeCenterPage: true,
        viewportFraction: 0.7,
      ),
    );
  }

  Widget _buildCard(String text, Color color) {
    return Card(
      elevation: 4,
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.school, size: 40, color: Colors.white),
            const SizedBox(height: 12),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
